import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/home/data/repos/fetch_players_repo.dart';

part 'fetch_players_state.dart';
part 'fetch_players_cubit.freezed.dart';

class FetchPlayersCubit extends Cubit<FetchPlayersState> {
  final FetchPlayersRepo repository;
  FetchPlayersCubit(this.repository) : super(const FetchPlayersState.initial());

  /// Fetch players and update the state
  Future<void> fetchPlayers() async {
    emit(const FetchPlayersState.fetchLoading());
    final players = await repository.fetchPlayers();
    log(players.toString());

    players.when(
      success: (players) => emit(
        FetchPlayersState.fetchSuccess(players),
      ),
      error: (message) => emit(FetchPlayersState.fetchError(message)),
    );
  }
}
