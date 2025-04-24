import 'package:flutter/material.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';

class ComparisonBox extends StatelessWidget {
  final ExerciseModel exercise;

  const ComparisonBox({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final history = [...exercise.history]
      ..sort((a, b) => b.date.compareTo(a.date));
    if (history.length < 2) {
      return const Text("Not enough data to compare.");
    }

    final latest = history[0];
    final previous = history[1];

    int totalSets = latest.sets;
    int totalReps = latest.reps;
    double avgWeight = (latest.weight + previous.weight) / 2;

    double volumeNow = latest.weight * latest.reps * latest.sets;
    double volumeBefore = previous.weight * previous.reps * previous.sets;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "COMPARED TO PREVIOUS",
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            _buildStat(
                "Total Sets", "$totalSets sets", latest.sets, previous.sets),
            _buildStat("Avg Weight", "${latest.weight} KG", latest.weight,
                previous.weight),
            _buildStat(
                "Volume", "${volumeNow.toInt()} KG", volumeNow, volumeBefore),
            _buildStat(
                "Total Reps", "$totalReps reps", latest.reps, previous.reps),
          ],
        ),
      ],
    );
  }

  Widget _buildStat(String title, String value, num current, num previous) {
    final diff = current - previous;
    final percentage = previous == 0 ? 0 : (diff / previous * 100).round();
    final isPositive = diff >= 0;
    final color = isPositive ? Colors.green : Colors.red;
    final arrow = isPositive ? "▲" : "▼";

    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(value,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(width: 4),
              Text(
                "$arrow ${diff.abs()} (${percentage.abs()}%)",
                style: TextStyle(fontSize: 12, color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
