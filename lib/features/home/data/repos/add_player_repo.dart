import 'package:tps/core/helpers/firestore_services.dart';
import 'package:tps/core/networking/add_player_result.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/home/data/models/freeze_model.dart';

class AddPlayerRepo {
  final FirestoreService _firestoreService;

  AddPlayerRepo(this._firestoreService);

  /// Creates a PlayerModel with calculated fields
  PlayerModel createPlayer({
    required String name,
    required String sport,
    required String phase,
    required int phone,
    required int money,
    required int duration, // Subscription duration in days
    String? description,
    FreezeModel? freeze,
  }) {
    final startDate = DateTime.now();
    final endDate = startDate.add(Duration(days: duration));
    final remainingDuration = Duration(
      days: endDate.difference(DateTime.now()).inDays,
    );

    return PlayerModel(
      name: name,
      sport: sport,
      phase: phase,
      phone: phone,
      money: money,
      subsDuration: duration,
      startDate: startDate,
      endDate: endDate,
      remainingDuration: DateTime.now().add(remainingDuration),
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
