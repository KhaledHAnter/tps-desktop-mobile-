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

  Future<void> addExercise(String phone) async {
    if (formKey.currentState!.validate()) {
      final exercise = repo.createExercise(nameController.text,
          int.parse(setsController.text), int.parse(repsController.text));
      emit(const ExercisesState.addLoading());
      try {
        await repo.addExercise(exercise, phone);
        emit(const ExercisesState.addSuccess());
      } catch (e) {
        emit(const ExercisesState.addError('Failed to add exercise.'));
      }
    }
  }

  Future<void> fetchExercises(String phone) async {
    try {
      emit(const ExercisesState.fecthLoading());
      final exercises = await repo.getExercises(phone);
      emit(ExercisesState.fecthSuccess(exercises));
    } catch (e) {
      emit(const ExercisesState.fecthError('Failed to fetch exercises.'));
    }
  }
}
