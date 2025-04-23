import 'package:tps/core/helpers/cach_time.dart';

import '../../../../core/helpers/firestore_services.dart';
import '../../../../core/networking/fetch_players_result.dart';
import '../models/freeze_model.dart';
import '../models/player_model.dart';

class FetchPlayersRepo {
  final FirestoreService _firestoreService;
  FetchPlayersRepo(this._firestoreService);

  /// Fetch players and map them to PlayerModel
  Future<FetchPlayersResult> fetchPlayers() async {
    final rawData = await _firestoreService.fetchPlayers();

    if (rawData == null) {
      return const FetchPlayersResult.error('Error fetching players');
    } else {
      final futures = rawData.map((data) async {
        final lastChat = await getLastChatTimestamp(data['phone']);
        bool shouldShowReminder = false;
        final endDate = DateTime.parse(data['endDate']);
        final remainingDays = endDate.difference(DateTime.now()).inDays;
        if (remainingDays > 0) {
          shouldShowReminder = true;
          if (lastChat != null) {
            final difference = DateTime.now().difference(lastChat);
            shouldShowReminder = difference.inHours >= 24;
          }
        }

        return PlayerModel(
          name: data['name'],
          age: data['age'] ?? 0,
          sport: data['sport'],
          phase: data['phase'],
          phone: data['phone'],
          money: data['money'],
          subsDuration: data['subsDuration'],
          startDate: DateTime.parse(data['startDate']),
          endDate: endDate,
          remainingDuration: remainingDays > 0 ? remainingDays : 0,
          // Ensure no negative durations
          description: data['description'],
          shouldShowReminder: shouldShowReminder,
          freeze: (data['freeze'] as List<dynamic>?)
              ?.map((freezeData) => FreezeModel(
                    freezeDays: freezeData['freezeDays'],
                    freezeReason: freezeData['freezeReason'],
                  ))
              .toList(),
        );
      }).toList();
      final players = await Future.wait(futures); // ✅ Await all futures

      return FetchPlayersResult.success(players);
    }
  }
}
