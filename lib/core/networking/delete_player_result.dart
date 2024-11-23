import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_player_result.freezed.dart';

@Freezed()
abstract class DeletePlayerResult<T> with _$DeletePlayerResult<T> {
  const factory DeletePlayerResult.success() = Success<T>;
  const factory DeletePlayerResult.error(String errMessage) = Failure<T>;
}
