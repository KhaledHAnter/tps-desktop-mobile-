part of 'fetch_single_player_cubit.dart';

@freezed
class FetchSinglePlayerState with _$FetchSinglePlayerState {
  const factory FetchSinglePlayerState.initial() = _Initial;
  const factory FetchSinglePlayerState.fetchLoading() = FetchLoading;
  const factory FetchSinglePlayerState.fetchSuccess(PlayerModel player) =
      FetchSuccess;
  const factory FetchSinglePlayerState.fetchError(String errMessage) =
      FetchError;
}
