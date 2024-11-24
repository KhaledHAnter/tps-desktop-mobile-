part of 'delete_player_cubit.dart';

@freezed
class DeletePlayerState with _$DeletePlayerState {
  const factory DeletePlayerState.initial() = _Initial;
  const factory DeletePlayerState.deleteLoading() = DeleteLoading;
  const factory DeletePlayerState.deleteSuccess() = DeleteSuccess;
  const factory DeletePlayerState.deleteError(String errMessage) = DeleteError;
}
