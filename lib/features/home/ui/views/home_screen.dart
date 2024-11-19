import 'package:flutter/material.dart';
import 'package:tps/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Text(S.of(context).hello),
        ],
      )),
    );
  }
}
