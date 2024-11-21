import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_player_result.freezed.dart';

@Freezed()
abstract class AddPlayerResult<T> with _$AddPlayerResult<T> {
  const factory AddPlayerResult.success() = Success<T>;
  const factory AddPlayerResult.error(String errMessage) = Failure<T>;
}
