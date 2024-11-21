import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/di/dependency_injection.dart';
import 'package:tps/core/routing/routes.dart';
import 'package:tps/features/home/logic/category_cubit/category_cubit.dart';
import 'package:tps/features/home/logic/cubit/add_player_cubit.dart';
import 'package:tps/features/home/ui/views/home_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments: arguments as ClassName)
    final arrguments = settings.arguments;

    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => CategoryCubit(),
            ),
            BlocProvider(
              create: (context) => getIt<AddPlayerCubit>(),
            ),
          ], child: const HomeScreen()),
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
