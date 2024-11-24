part of 'freeze_player_cubit.dart';

@freezed
class FreezePlayerState with _$FreezePlayerState {
  const factory FreezePlayerState.initial() = _Initial;
  const factory FreezePlayerState.freezeLoading() = FreezeLoading;
  const factory FreezePlayerState.freezeSuccess() = FreezeSuccess;
  const factory FreezePlayerState.freezeError(String errMessage) = FreezeError;
}
