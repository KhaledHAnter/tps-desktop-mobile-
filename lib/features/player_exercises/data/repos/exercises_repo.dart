import 'package:tps/core/helpers/firestore_services.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';

class ExercisesRepo {
  final FirestoreService _firestoreService;

  ExercisesRepo(this._firestoreService);

  ExerciseModel createExercise(String name, int reps, int sets) {
    return ExerciseModel(name: name, reps: reps, sets: sets, history: []);
  }

  Future<void> addExercise(ExerciseModel exercise, String phone) async {
    try {
      await _firestoreService.addExerciseToFirestore(exercise, phone);
    } catch (e) {
      print('Failed to add exercise: $e');
      rethrow;
    }
  }

  Future<List<ExerciseModel>> getExercises(String phone) async {
    try {
      return await _firestoreService.fetchExercisesFromFirestore(phone);
    } catch (e) {
      print('Failed to fetch exercises: $e');
      rethrow;
    }
  }
}
