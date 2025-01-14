import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';
import 'package:tps/features/player_exercises/data/repos/exercises_repo.dart';

part 'exercises_state.dart';
part 'exercises_cubit.freezed.dart';

class ExercisesCubit extends Cubit<ExercisesState> {
  final ExercisesRepo repo;

  ExercisesCubit(this.repo) : super(const ExercisesState.initial());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  String? phone;

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

  //  Future<void> addHistory(String phone, String exerciseName, HistoryModel history) async {
  //   try {
  //     emit(ExercisesLoading());
  //     await _repository.addHistoryToExercise(phone, exerciseName, history);
  //     emit(ExercisesSuccess());  // On success, emit the success state
  //   } catch (e) {
  //     emit(ExercisesFailure(error: 'Failed to add history.'));
  //   }
  // }
}
