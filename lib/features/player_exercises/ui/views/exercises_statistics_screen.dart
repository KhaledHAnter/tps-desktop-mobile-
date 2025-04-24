import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/widgets/gray_container.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';
import 'package:tps/features/player_exercises/ui/widgets/build_exercise_chart.dart';
import 'package:tps/features/player_exercises/ui/widgets/statistics_header.dart';

class ExercisesStatisticsScreen extends StatelessWidget {
  final List<ExerciseModel> allExercises;

  const ExercisesStatisticsScreen({super.key, required this.allExercises});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    final int crossAxisCount = width < 500 ? 1 : width ~/ 350;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const StatisticsHeader(),
              const Gap(16),
              Expanded(
                child: GridView.builder(
                  itemCount: allExercises.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1.5, // Adjust as needed
                  ),
                  itemBuilder: (context, index) {
                    final exercise = allExercises[index];
                    return GrayContainer(
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
                          Expanded(
                            child: LineChart(buildChart(exercise)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
