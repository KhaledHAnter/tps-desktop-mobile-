class HistoryModel {
  final double weight;
  final int reps;
  final int sets;
  final DateTime date;

  HistoryModel({
    required this.weight,
    required this.reps,
    required this.sets,
    required this.date,
  });

  // Convert HistoryModel to a map (for Firestore storage)
  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'reps': reps,
      'sets': sets,
      'date': date.toIso8601String(),
    };
  }

  // Convert a map back to HistoryModel (for Firestore retrieval)
  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      weight: map['weight'],
      reps: map['reps'],
      sets: map['sets'],
      date: DateTime.parse(map['date']),
    );
  }
}

class ExerciseModel {
  final String name;
  final int reps;
  final int sets;
  List<HistoryModel> history;

  ExerciseModel({
    required this.name,
    required this.reps,
    required this.sets,
    required this.history,
  });

  // Convert ExerciseModel to a map (for Firestore storage)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'reps': reps,
      'sets': sets,
      'history': history.map((historyItem) => historyItem.toMap()).toList(),
    };
  }

  // Convert a map back to ExerciseModel (for Firestore retrieval)
  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      name: map['name'],
      reps: map['reps'],
      sets: map['sets'],
      history: List<HistoryModel>.from(
        map['history']?.map((item) => HistoryModel.fromMap(item)) ?? [],
      ),
    );
  }

  // Add new history entry to the exercise
  void addHistory(HistoryModel historyEntry) {
    history.add(historyEntry);
  }
}
