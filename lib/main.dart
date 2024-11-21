import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tps/core/routing/app_router.dart';
import 'package:tps/tps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Tps(
    appRouter: AppRouter(),
  ));
}
