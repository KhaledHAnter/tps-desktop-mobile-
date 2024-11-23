import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_days_result.freezed.dart';

@Freezed()
abstract class AddDaysResult<T> with _$AddDaysResult<T> {
  const factory AddDaysResult.success() = Success<T>;
  const factory AddDaysResult.error(String errMessage) = Failure<T>;
}
