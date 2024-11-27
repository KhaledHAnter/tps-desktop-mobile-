import 'package:get_it/get_it.dart';
import 'package:tps/core/helpers/directory_utils.dart';
import 'package:tps/core/helpers/excel_gen_utils.dart';
import 'package:tps/features/home/data/repos/excel_generation_repo.dart';
import 'package:tps/features/player_details/data/repos/delete_player_repo.dart';
import 'package:tps/features/player_details/data/repos/fetch_single_player_repo.dart';
import 'package:tps/features/player_details/data/repos/freeze_player_repo.dart';
import 'package:tps/features/player_details/logic/delete_player_cubit/delete_player_cubit.dart';
import 'package:tps/features/player_details/logic/fetch_single_player_cubit/fetch_single_player_cubit.dart';
import 'package:tps/features/player_details/logic/freeze_player_cubit/freeze_player_cubit.dart';
import '../helpers/firestore_services.dart';
import '../../features/home/data/repos/add_player_repo.dart';
import '../../features/home/data/repos/fetch_players_repo.dart';
import '../../features/home/logic/add_player_cubit/add_player_cubit.dart';
import '../../features/home/logic/fetch_player_cubit/fetch_players_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // FireStore
  FirestoreService firestoreService = FirestoreService();

  // exxel generation
  ExcelGenUtils excelGenUtils = ExcelGenUtils();

  // Directory Utils
  DirectoryUtils directoryUtils = DirectoryUtils();

  // Add Player
  getIt.registerLazySingleton<AddPlayerRepo>(
      () => AddPlayerRepo(firestoreService));
  getIt.registerFactory<AddPlayerCubit>(() => AddPlayerCubit(getIt()));

  // Fetch Player
  getIt.registerLazySingleton<FetchPlayersRepo>(
      () => FetchPlayersRepo(firestoreService));
  getIt.registerFactory<FetchPlayersCubit>(() => FetchPlayersCubit(getIt()));

  // Fetch Single Player
  getIt.registerLazySingleton<FetchSinglePlayerRepo>(
      () => FetchSinglePlayerRepo(firestoreService));
  getIt.registerFactory<FetchSinglePlayerCubit>(
      () => FetchSinglePlayerCubit(getIt()));

  // delete Single Player
  getIt.registerLazySingleton<DeletePlayerRepo>(
      () => DeletePlayerRepo(firestoreService));
  getIt.registerFactory<DeletePlayerCubit>(() => DeletePlayerCubit(getIt()));

  // freeze Player
  getIt.registerLazySingleton<FreezePlayerRepo>(
      () => FreezePlayerRepo(firestoreService));
  getIt.registerFactory<FreezePlayerCubit>(() => FreezePlayerCubit(getIt()));

  // excel gen
  getIt.registerLazySingleton<ExcelGenerationRepo>(() => ExcelGenerationRepo(
      excelGenUtils: excelGenUtils, directoryUtils: directoryUtils));
}
