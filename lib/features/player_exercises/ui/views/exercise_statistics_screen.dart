import 'package:flutter/material.dart';
import 'package:tps/features/player_exercises/ui/widgets/statistics_header.dart';

class ExerciseStatisticsScreen extends StatelessWidget {
  const ExerciseStatisticsScreen({super.key});

  get phone => null;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[StatisticsHeader()],
          ),
        ),
      ),
    );
  }
}
