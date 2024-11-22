part of 'fetch_players_cubit.dart';

@freezed
class FetchPlayersState with _$FetchPlayersState {
  const factory FetchPlayersState.initial() = _Initial;
  const factory FetchPlayersState.fetchLoading() = FetchLoading;
  const factory FetchPlayersState.fetchSuccess(List<PlayerModel> players) =
      FetchSuccess;
  const factory FetchPlayersState.fetchError(String errMessage) = FetchError;
}
