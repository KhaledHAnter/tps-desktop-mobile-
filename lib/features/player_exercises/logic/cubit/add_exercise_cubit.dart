import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tps/features/player_exercises/data/repos/add_exercise_repo.dart';

part 'add_exercise_state.dart';
part 'add_exercise_cubit.freezed.dart';

class AddExerciseCubit extends Cubit<AddExerciseState> {
  final AddExerciseRepo repo;

  AddExerciseCubit(this.repo) : super(const AddExerciseState.initial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  Future<void> addExercise(String phone) async {
    if (formKey.currentState!.validate()) {
      final exercise = repo.createExercise(nameController.text,
          int.parse(setsController.text), int.parse(repsController.text));

      emit(const AddExerciseState.loading());
      try {
        await repo.saveExercise(exercise, phone);
        emit(const AddExerciseState.success());
      } catch (e) {
        print('Error adding exercise: $e');
        emit(const AddExerciseState.error(
            'Failed to add exercise. Please try again.'));
      }
    }
  }
}
