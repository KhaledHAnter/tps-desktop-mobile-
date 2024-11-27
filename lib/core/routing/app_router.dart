import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/local_auth/ui/views/local_auth_screen.dart';
import 'package:tps/features/player_details/logic/delete_player_cubit/delete_player_cubit.dart';
import 'package:tps/features/player_details/logic/fetch_single_player_cubit/fetch_single_player_cubit.dart';
import 'package:tps/features/player_details/logic/freeze_player_cubit/freeze_player_cubit.dart';
import 'package:tps/features/player_details/logic/player_details_cubit/player_details_cubit.dart';
import 'package:tps/features/player_details/ui/views/player_details_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';
import '../../features/home/logic/category_cubit/category_cubit.dart';
import '../../features/home/logic/fetch_player_cubit/fetch_players_cubit.dart';
import '../../features/home/ui/views/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments: arguments as ClassName)
    final arrguments = settings.arguments;

    switch (settings.name) {
      case Routes.localAuthScreen:
        return MaterialPageRoute(
          builder: (_) => const LocalAuthScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => CategoryCubit(),
            ),
            BlocProvider(
              create: (context) => getIt<FetchPlayersCubit>()..fetchPlayers(),
            ),
          ], child: const HomeScreen()),
        );
      case Routes.palyerDetailsScreen:
        arrguments as PlayerModel;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PlayerDetailsCubit(),
              ),
              BlocProvider(
                create: (context) => getIt<FetchSinglePlayerCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<DeletePlayerCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<FreezePlayerCubit>(),
              ),
            ],
            child: PlayerDetailsScreen(
              player: arrguments,
            ),
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
