import 'package:flutter/material.dart';
import 'package:tps/core/routing/app_router.dart';
import 'package:tps/core/routing/routes.dart';
import 'package:tps/core/theming/colors.dart';

class Tps extends StatelessWidget {
  final AppRouter appRouter;
  const Tps({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginView(),
      debugShowCheckedModeBanner: false,
      title: "Doc Adavanced Flutter",
      theme: ThemeData(
        primaryColor: ColorsManager.mainBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Routes.homeScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
