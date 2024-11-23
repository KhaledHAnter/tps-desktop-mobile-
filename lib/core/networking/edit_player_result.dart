import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_player_result.freezed.dart';

@Freezed()
abstract class EditPlayerResult<T> with _$EditPlayerResult<T> {
  const factory EditPlayerResult.success() = Success<T>;
  const factory EditPlayerResult.error(String errMessage) = Failure<T>;
}
