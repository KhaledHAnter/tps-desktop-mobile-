import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';
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

  LineChartData buildChart(ExerciseModel exercise) {
    final history = exercise.history..sort((a, b) => a.date.compareTo(b.date));

    final spots = history.map((h) {
      final volume = h.weight * h.reps * h.sets;
      final x = h.date.millisecondsSinceEpoch.toDouble();
      return FlSpot(x, volume);
    }).toList();

    return LineChartData(
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
              return Text(DateFormat.Md().format(date),
                  style: const TextStyle(fontSize: 10));
            },
            interval:
                (spots.length >= 2) ? ((spots.last.x - spots.first.x) / 4) : 1,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: true, reservedSize: 40),
        ),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      gridData: const FlGridData(show: true),
      borderData: FlBorderData(show: true),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: false,
          color: Colors.blue,
          dotData: const FlDotData(show: true),
          belowBarData:
              BarAreaData(show: true, color: Colors.blue.withOpacity(0.2)),
        )
      ],
    );
  }
}
