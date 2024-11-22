import 'package:get_it/get_it.dart';
import '../helpers/firestore_services.dart';
import '../../features/home/data/repos/add_player_repo.dart';
import '../../features/home/data/repos/fetch_players_repo.dart';
import '../../features/home/logic/add_player_cubit/add_player_cubit.dart';
import '../../features/home/logic/fetch_player_cubit/fetch_players_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // FireStore
  FirestoreService firestoreService = FirestoreService();

  // Add Player
  getIt.registerLazySingleton<AddPlayerRepo>(
      () => AddPlayerRepo(firestoreService));
  getIt.registerFactory<AddPlayerCubit>(() => AddPlayerCubit(getIt()));

  // Fetch Player
  getIt.registerLazySingleton<FetchPlayersRepo>(
      () => FetchPlayersRepo(firestoreService));
  getIt.registerFactory<FetchPlayersCubit>(() => FetchPlayersCubit(getIt()));
}
