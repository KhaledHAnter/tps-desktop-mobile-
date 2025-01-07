part of 'add_exercise_cubit.dart';

@freezed
class AddExerciseState with _$AddExerciseState {
  const factory AddExerciseState.initial() = _Initial;
  const factory AddExerciseState.loading() = Loading;
  const factory AddExerciseState.success() = Success;
  const factory AddExerciseState.error(String errMessage) = Error;
}
