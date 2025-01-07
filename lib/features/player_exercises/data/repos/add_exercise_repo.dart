import 'package:tps/core/helpers/firestore_services.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';

class AddExerciseRepo {
  final FirestoreService _firestoreService;

  AddExerciseRepo(this._firestoreService);

  ExerciseModel createExercise(String name, int reps, int sets) {
    return ExerciseModel(name: name, reps: reps, sets: sets, history: []);
  }

  Future<void> saveExercise(ExerciseModel exercise, String phone) async {
    try {
      await _firestoreService.addExerciseToFirestore(exercise, phone);
    } catch (e) {
      print('Error saving exercise: $e');
      rethrow; // Propagate the error
    }
  }
}
