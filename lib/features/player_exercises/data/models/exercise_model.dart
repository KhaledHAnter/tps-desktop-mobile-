import 'package:tps/features/player_exercises/data/models/exercise_history_model.dart';

class ExerciseModel {
  final String name;
  final int reps, sets;
  final List<ExerciseHistoryModel> history;

  ExerciseModel({
    required this.name,
    required this.reps,
    required this.sets,
    required this.history,
  });
}
