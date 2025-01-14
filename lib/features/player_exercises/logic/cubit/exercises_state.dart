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
  const factory ExercisesState.deleteLoading() = DeleteLoading;
  const factory ExercisesState.deleteSuccess() = DeleteSuccess;
  const factory ExercisesState.deleteError(String errMessage) = DeleteError;
  const factory ExercisesState.addHistoryLoading() = AddHistoryLoading;
  const factory ExercisesState.addHistorySuccess() = AddHistorySuccess;
  const factory ExercisesState.addHistoryError(String errMessage) =
      AddHistoryError;
  const factory ExercisesState.deleteHistoryLoading() = DeleteHistoryLoading;
  const factory ExercisesState.deleteHistorySuccess() = DeleteHistorySuccess;
  const factory ExercisesState.deleteHistoryError(String errMessage) =
      DeleteHistoryError;
}
