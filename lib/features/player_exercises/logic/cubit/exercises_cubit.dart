import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';
import 'package:tps/features/player_exercises/data/repos/exercises_repo.dart';

part 'exercises_state.dart';
part 'exercises_cubit.freezed.dart';

class ExercisesCubit extends Cubit<ExercisesState> {
  @override
  Future<void> close() {
    // Clean up resources if needed
    return super.close();
  }

  final ExercisesRepo repo;

  ExercisesCubit(this.repo) : super(const ExercisesState.initial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  String? phone;
  double? weight;
  int? sets;
  int? reps;
  List<HistoryModel> history = [];

  void incrementReps(int value) => reps = (reps ?? 0) + value;
  void decrementReps(int value) =>
      reps! > 0 ? reps = (reps ?? 0) - value : null;

  void incrementSets(int value) => sets = (sets ?? 0) + value;
  void decrementSets(int value) =>
      sets! > 0 ? sets = (sets ?? 0) - value : null;

  void incrementWeight(double value) => weight = (weight ?? 0) + value;
  void decrementWeight(double value) =>
      weight! > 0 ? weight = (weight ?? 0) - value : null;

  Future<void> addExercise(String phone) async {
    if (formKey.currentState!.validate()) {
      final exercise = repo.createExercise(nameController.text,
          int.parse(setsController.text), int.parse(repsController.text));
      emit(const ExercisesState.addLoading());
      try {
        await repo.addExercise(exercise, phone);
        emit(const ExercisesState.addSuccess());
      } catch (e) {
        emit(const ExercisesState.addError('خطأ في إضافة التمرين'));
      }
    }
  }

  Future<void> fetchExercises(String phone) async {
    try {
      emit(const ExercisesState.fecthLoading());
      final exercises = await repo.getExercises(phone);
      emit(ExercisesState.fecthSuccess(exercises));
    } catch (e) {
      emit(const ExercisesState.fecthError('خطأ في جلب التمارين'));
    }
  }

  Future<bool> showDeleteConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible:
              false, // User must select an option to close the dialog
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('حذف التمرين'),
              content: const Text('هل أنت متأكد من حذف التمرين؟'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(false); // User cancels the deletion
                  },
                  child: const Text('الغاء'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(true); // User confirms the deletion
                  },
                  child: const Text('حذف'),
                ),
              ],
            );
          },
        ) ??
        false; // Default to false if the dialog is dismissed
  }

  Future<void> deleteExercise(String phone, String exerciseName) async {
    try {
      emit(const ExercisesState.deleteLoading());
      await repo.deleteExercise(phone, exerciseName);
      emit(const ExercisesState
          .deleteSuccess()); // Emitting success after deletion
    } catch (e) {
      emit(const ExercisesState.deleteError('خطأ في حذف التمرين'));
    }
  }

  Future<void> addHistory(
      String phone, String exerciseName, HistoryModel history) async {
    try {
      emit(const ExercisesState.addHistoryLoading());
      await repo.addHistory(phone, exerciseName, history);
      emit(const ExercisesState
          .addHistorySuccess()); // On success, emit the success state
    } catch (e) {
      emit(const ExercisesState.addHistoryError('Failed to add history.'));
    }
  }

  // Delete history entry
  Future<void> deleteHistory(
      String phone, String exerciseName, int historyIndex) async {
    try {
      emit(const ExercisesState.deleteHistoryLoading());
      // Call the repository to delete the history entry
      await repo.deleteHistoryEntry(phone, exerciseName, historyIndex);
      emit(const ExercisesState
          .deleteHistorySuccess()); // You can pass the updated history if needed
    } catch (e) {
      emit(ExercisesState.deleteHistoryError('Failed to delete history: $e'));
    }
  }
}
