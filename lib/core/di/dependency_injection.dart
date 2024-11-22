import 'package:get_it/get_it.dart';
import 'package:tps/core/helpers/firestore_services.dart';
import 'package:tps/features/home/data/repos/add_player_repo.dart';
import 'package:tps/features/home/logic/add_player_cubit/add_player_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // FireStore
  FirestoreService firestoreService = FirestoreService();

  // Add Player
  getIt.registerLazySingleton<AddPlayerRepo>(
      () => AddPlayerRepo(firestoreService));
  getIt.registerFactory<AddPlayerCubit>(() => AddPlayerCubit(getIt()));
}
