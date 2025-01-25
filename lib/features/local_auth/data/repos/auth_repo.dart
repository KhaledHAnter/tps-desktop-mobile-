import 'package:tps/core/helpers/firestore_services.dart';
import 'package:tps/features/home/data/models/profile_model.dart';

class AuthRepo {
  final FirestoreService _firestoreService;

  AuthRepo(this._firestoreService);

  Future<List<ProfileModel>?> fetchallProfileData() async =>
      await _firestoreService.fetchallProfileData();
}
