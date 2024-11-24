import 'package:tps/core/helpers/firestore_services.dart';
import 'package:tps/features/home/data/models/freeze_model.dart';

class FreezePlayerRepo {
  final FirestoreService _firestoreService;

  FreezePlayerRepo(this._firestoreService);

  /// Add a freeze to the player's subscription
  Future<void> addPlayerFreeze(
      String documentId, int freezeDays, String freezeReason) async {
    final newFreeze = FreezeModel(
      freezeDays: freezeDays,
      freezeReason: freezeReason,
    );
    await _firestoreService.addPlayerFreeze(documentId, newFreeze);
  }
}
