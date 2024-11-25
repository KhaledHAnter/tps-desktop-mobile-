import '../../../../core/helpers/firestore_services.dart';
import '../../../../core/networking/fetch_players_result.dart';
import '../models/player_model.dart';
import '../models/freeze_model.dart';

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
        final dataRemainingDays = data['remainingDuration'];

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
          remainingDuration: dataRemainingDays == 0
              ? remainingDays > 0
                  ? remainingDays
                  : 0
              : dataRemainingDays, // Ensure no negative durations
          description: data['description'],
          freeze: (data['freeze'] as List<dynamic>?)
              ?.map((freezeData) => FreezeModel(
                    freezeDays: freezeData['freezeDays'],
                    freezeReason: freezeData['freezeReason'],
                  ))
              .toList(),
        );
      }).toList());
    }
  }
}
