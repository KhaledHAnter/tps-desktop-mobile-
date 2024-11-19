import 'package:flutter/material.dart';
import 'package:tps/core/routing/app_router.dart';
import 'package:tps/core/routing/routes.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Tps extends StatelessWidget {
  final AppRouter appRouter;
  const Tps({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("ar"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: "TPS",
      theme: ThemeData(
        primaryColor: ColorsManager.mainBage,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "DIN Next LT Arabic",
      ),
      initialRoute: Routes.homeScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
