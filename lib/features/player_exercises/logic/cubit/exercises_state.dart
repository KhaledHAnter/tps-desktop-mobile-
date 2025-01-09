part of 'exercises_cubit.dart';

@freezed
class ExercisesState with _$ExercisesState {
  const factory ExercisesState.initial() = _Initial;
  const factory ExercisesState.addLoading() = AddLoading;
  const factory ExercisesState.addSuccess() = AddSuccess;
  const factory ExercisesState.addError(String errMessage) = AddError;
  const factory ExercisesState.fecthLoading() = FecthLoading;
  const factory ExercisesState.fecthSuccess(List<ExerciseModel> exercises) =
      FecthSuccess;
  const factory ExercisesState.fecthError(String errMessage) = FecthError;
}
