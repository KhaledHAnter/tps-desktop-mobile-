import 'package:tps/core/helpers/firestore_services.dart';
import 'package:tps/core/networking/fetch_players_result.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/home/data/models/freeze_model.dart';

class FetchPlayersRepo {
  final FirestoreService _firestoreService;

  FetchPlayersRepo(this._firestoreService);

  /// Fetch players and map them to PlayerModel
  Future<FetchPlayersResult> fetchPlayers() async {
    final rawData = await _firestoreService.fetchPlayers();

    if (rawData == null) {
      return const FetchPlayersResult.error('Error fetching players');
    } else {
      return FetchPlayersResult.success(rawData.map((data) {
        final endDate = DateTime.parse(data['endDate']);
        final remainingDays = endDate.difference(DateTime.now()).inDays;

        return PlayerModel(
          name: data['name'],
          sport: data['sport'],
          phase: data['phase'],
          phone: data['phone'],
          money: data['money'],
          subsDuration: data['subsDuration'],
          startDate: DateTime.parse(data['startDate']),
          endDate: endDate,
          remainingDuration: remainingDays > 0
              ? remainingDays
              : 0, // Ensure no negative durations
          description: data['description'],
          freeze: (data['freeze'] as List<dynamic>?)
              ?.map((freezeData) => FreezeModel(
                    isFreeze: freezeData['isFreeze'],
                    freezeTime: freezeData['freezeTime'],
                  ))
              .toList(),
        );
      }).toList());
    }
  }
}
