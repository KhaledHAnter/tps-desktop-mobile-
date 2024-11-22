import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_player_state.freezed.dart';

@freezed
class AddPlayerState with _$AddPlayerState {
  const factory AddPlayerState.initial() = _Initial;
  const factory AddPlayerState.loading() = Loading;
  const factory AddPlayerState.success() = Success;
  const factory AddPlayerState.error(String errMessage) = Error;
}
