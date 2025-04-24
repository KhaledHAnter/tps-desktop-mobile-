import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';

LineChartData buildChart(ExerciseModel exercise) {
  final history = exercise.history..sort((a, b) => a.date.compareTo(b.date));

  final spots = history.map((h) {
    final volume = h.weight * h.reps * h.sets;
    final x = h.date.millisecondsSinceEpoch.toDouble();
    return FlSpot(x, volume);
  }).toList();

// 🧠 Determine trend direction
  Color trendColor = Colors.grey;
  if (spots.length >= 2) {
    final firstVolume = spots.first.y;
    final lastVolume = spots.last.y;

    if (lastVolume > firstVolume) {
      trendColor = Colors.lightGreen; // 📈 Improved
    } else if (lastVolume < firstVolume) {
      trendColor = Colors.redAccent; // 📉 Decreased
    } else {
      trendColor = Colors.grey; // Same volume
    }
  }

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
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    ),
    gridData: const FlGridData(show: true),
    borderData: FlBorderData(show: true),
    lineBarsData: [
      LineChartBarData(
        spots: spots,
        isCurved: false,
        color: Colors.black,
        dotData: const FlDotData(show: true),
        belowBarData:
            BarAreaData(show: true, color: trendColor.withOpacity(0.2)),
      )
    ],
  );
}
