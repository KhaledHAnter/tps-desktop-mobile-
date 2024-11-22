import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_players_result.freezed.dart';

@Freezed()
abstract class FetchPlayersResult<T> with _$FetchPlayersResult<T> {
  const factory FetchPlayersResult.success(T data) = Success<T>;
  const factory FetchPlayersResult.error(String errMessage) = Failure<T>;
}
