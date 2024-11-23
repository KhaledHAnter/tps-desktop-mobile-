import 'package:tps/core/helpers/firestore_services.dart';
import 'package:tps/core/networking/fetch_players_result.dart';
import 'package:tps/features/home/data/models/freeze_model.dart';
import 'package:tps/features/home/data/models/player_model.dart';

class FetchSinglePlayerRepo {
  final FirestoreService _firestoreService;
  FetchSinglePlayerRepo(this._firestoreService);

  Future<FetchPlayersResult> fetchPlayerById(String documentId) async {
    final rawData = await _firestoreService.fetchPlayerById(documentId);

    if (rawData == null) {
      return const FetchPlayersResult.error('Error fetching player');
    } else {
      try {
        final endDate = DateTime.parse(rawData['endDate']);
        final remainingDays = endDate.difference(DateTime.now()).inDays;

        final player = PlayerModel(
          name: rawData['name'],
          sport: rawData['sport'],
          phase: rawData['phase'],
          phone: rawData['phone'],
          money: rawData['money'],
          subsDuration: rawData['subsDuration'],
          startDate: DateTime.parse(rawData['startDate']),
          endDate: endDate,
          remainingDuration:
              remainingDays > 0 ? remainingDays : 0, // Avoid negative durations
          description: rawData['description'],
          freeze: (rawData['freeze'] as List<dynamic>?)
              ?.map((freezeData) => FreezeModel(
                    isFreeze: freezeData['isFreeze'],
                    freezeTime: freezeData['freezeTime'],
                  ))
              .toList(),
        );

        return FetchPlayersResult.success(player);
      } catch (e) {
        return FetchPlayersResult.error('Error processing player data: $e');
      }
    }
  }
}
