import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'tps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupGetIt();
  runApp(Tps(
    appRouter: AppRouter(),
  ));
}
