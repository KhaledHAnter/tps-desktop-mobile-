import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tps/core/di/dependency_injection.dart';
import 'package:tps/core/routing/app_router.dart';
import 'package:tps/tps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupGetIt();
  runApp(Tps(
    appRouter: AppRouter(),
  ));
}
