import 'package:freezed_annotation/freezed_annotation.dart';
part 'freeze_player_result.freezed.dart';

@Freezed()
abstract class FreezePlayerResult<T> with _$FreezePlayerResult<T> {
  const factory FreezePlayerResult.success() = Success<T>;
  const factory FreezePlayerResult.error(String errMessage) = Failure<T>;
}
