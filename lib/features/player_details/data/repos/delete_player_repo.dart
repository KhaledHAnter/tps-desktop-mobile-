import 'package:tps/core/helpers/firestore_services.dart';
import 'package:tps/core/networking/delete_player_result.dart';

class DeletePlayerRepo {
  final FirestoreService _firestoreService;

  DeletePlayerRepo(this._firestoreService);

  /// Delete player by document ID
  Future<DeletePlayerResult> deletePlayer(String documentId) async {
    try {
      await _firestoreService.deletePlayer(documentId);
      return const DeletePlayerResult.success();
    } on Exception catch (e) {
      return DeletePlayerResult.error("Failed to delete player $e");
    }
  }
}
