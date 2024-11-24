import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tps/firebase_options.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'tps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(Tps(
    appRouter: AppRouter(),
  ));
}
