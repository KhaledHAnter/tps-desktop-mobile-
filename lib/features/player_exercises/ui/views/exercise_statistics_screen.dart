import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';
import 'package:tps/features/player_exercises/ui/widgets/build_exercise_chart.dart';
import 'package:tps/features/player_exercises/ui/widgets/statistics_header.dart';

class ExerciseStatisticsScreen extends StatelessWidget {
  final List<ExerciseModel> allExercises;

  const ExerciseStatisticsScreen({super.key, required this.allExercises});

  @override
  Widget build(BuildContext context) {
    log(allExercises.length.toString());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const StatisticsHeader(),
              const Gap(16),
              ...allExercises.map(
                (exercise) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exercise.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      AspectRatio(
                        aspectRatio: 1.7,
                        child: LineChart(
                          buildChart(exercise),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
