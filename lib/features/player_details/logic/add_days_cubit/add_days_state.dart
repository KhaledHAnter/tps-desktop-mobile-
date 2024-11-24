part of 'add_days_cubit.dart';

@freezed
class AddDaysState with _$AddDaysState {
  const factory AddDaysState.initial() = _Initial;
  const factory AddDaysState.addDaysLoading() = AddDaysLoading;
  const factory AddDaysState.addDaysSuccess() = AddDaysSuccess;
  const factory AddDaysState.addDaysError(String message) = AddDaysError;
}
