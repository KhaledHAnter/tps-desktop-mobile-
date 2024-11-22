import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/colors.dart';
import 'generated/l10n.dart';
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
