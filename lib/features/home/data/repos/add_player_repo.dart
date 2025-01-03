import '../../../../core/helpers/firestore_services.dart';
import '../../../../core/networking/add_player_result.dart';
import '../models/player_model.dart';
import '../models/freeze_model.dart';

class AddPlayerRepo {
  final FirestoreService _firestoreService;

  AddPlayerRepo(this._firestoreService);

  /// Creates a PlayerModel with calculated fields
  PlayerModel createPlayer({
    required String name,
    required String sport,
    required String phase,
    required String phone,
    required int money,
    required int duration, // Subscription duration in days
    required int age,
    String? description,
    List<FreezeModel>? freeze,
  }) {
    final startDate = DateTime.now();
    final endDate = startDate.add(Duration(days: duration));
    const remainingDuration = 0;

    return PlayerModel(
      name: name,
      age: age,
      sport: sport,
      phase: phase,
      phone: phone,
      money: money,
      subsDuration: duration,
      startDate: startDate,
      endDate: endDate,
      remainingDuration: remainingDuration,
      freeze: freeze,
      description: description,
    );
  }

  /// Adds player to Firestore
  Future<AddPlayerResult> savePlayer(PlayerModel player) async {
    bool success = await _firestoreService.addPlayerToFirestore(player);

    return success
        ? const AddPlayerResult.success()
        : const AddPlayerResult.error('Error adding player');
  }
}
