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
    // options: const FirebaseOptions(
    //   apiKey: "AIzaSyCmjF8h5JbZwX4Lsm27stoQPxBfiqMQ8z8",
    //   authDomain: "tps-app-dd7b0.firebaseapp.com",
    //   projectId: "tps-app-dd7b0",
    //   storageBucket: "tps-app-dd7b0.firebasestorage.app",
    //   messagingSenderId: "82807974550",
    //   appId: "1:82807974550:web:2c88c052c97f6e4f8d70b7",
    //   measurementId: "G-1M5BCJGVR5",
    // ),
  );
  setupGetIt();
  runApp(Tps(
    appRouter: AppRouter(),
  ));
}
