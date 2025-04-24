import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/widgets/gray_container.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';
import 'package:tps/features/player_exercises/ui/widgets/build_exercise_chart.dart';
import 'package:tps/features/player_exercises/ui/widgets/comparison_box.dart';
import 'package:tps/features/player_exercises/ui/widgets/statistics_header.dart';

class SingleExerciseStatistics extends StatelessWidget {
  final ExerciseModel exercise;
  const SingleExerciseStatistics({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const StatisticsHeader(),
            const Gap(16),
            GrayContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      exercise.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Gap(4),
                  const SizedBox(height: 8),
                  AspectRatio(
                    aspectRatio: 1.5,
                    child: LineChart(buildChart(exercise)),
                  ),
                ],
              ),
            ),
            const Gap(8),
            Directionality(
                textDirection: TextDirection.ltr,
                child: GrayContainer(child: ComparisonBox(exercise: exercise))),
          ],
        ),
      )),
    );
  }
}
