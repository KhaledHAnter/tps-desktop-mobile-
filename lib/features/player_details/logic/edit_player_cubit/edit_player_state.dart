part of 'edit_player_cubit.dart';

@freezed
class EditPlayerState with _$EditPlayerState {
  const factory EditPlayerState.initial() = _Initial;
  const factory EditPlayerState.editLoading() = EditLoading;
  const factory EditPlayerState.editSuccess() = EditSuccess;
  const factory EditPlayerState.editError(String message) = EditError;
}
