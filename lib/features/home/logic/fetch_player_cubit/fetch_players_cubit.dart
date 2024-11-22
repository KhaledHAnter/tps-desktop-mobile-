import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/home/data/repos/fetch_players_repo.dart';

import '../../data/models/sort_criteria_enum.dart';

part 'fetch_players_state.dart';
part 'fetch_players_cubit.freezed.dart';

class FetchPlayersCubit extends Cubit<FetchPlayersState> {
  final FetchPlayersRepo repository;
  List<PlayerModel> allPlayers =
      []; // To store all players for resetting filters

  FetchPlayersCubit(this.repository) : super(const FetchPlayersState.initial());

  void sortPlayers(List<PlayerModel> players, SortCriteria criteria) {
    players.sort((a, b) {
      switch (criteria) {
        case SortCriteria.newest:
          return b.startDate.compareTo(a.startDate); // Newest first
        case SortCriteria.money:
          return b.money.compareTo(a.money); // Highest money first
        case SortCriteria.remainingDuration:
          return b.remainingDuration
              .compareTo(a.remainingDuration); // Longest remaining first
        case SortCriteria.name:
          return a.name.compareTo(b.name); // Alphabetical order
        case SortCriteria.sport:
          return a.sport.compareTo(b.sport); // Alphabetical order
      }
    });
  }

  /// Fetch players and update the state
  Future<void> fetchPlayers() async {
    emit(const FetchPlayersState.fetchLoading());
    final players = await repository.fetchPlayers();
    players.when(
      success: (fetchedPlayers) {
        allPlayers = fetchedPlayers; // Cache all players for filtering
        emit(FetchPlayersState.fetchSuccess(fetchedPlayers));
      },
      error: (message) => emit(FetchPlayersState.fetchError(message)),
    );
  }

  /// Fetch and sort players
  Future<void> fetchAndSortPlayers(SortCriteria criteria) async {
    emit(const FetchPlayersState.fetchLoading());
    final players = await repository.fetchPlayers();
    players.when(
      success: (fetchedPlayers) {
        sortPlayers(fetchedPlayers, criteria);
        allPlayers = fetchedPlayers; // Cache all players for filtering
        emit(FetchPlayersState.fetchSuccess(fetchedPlayers));
      },
      error: (message) => emit(FetchPlayersState.fetchError(message)),
    );
  }

  /// Filter players by phase
  void filterPlayersByPhase(String phase) {
    if (phase == "All") {
      // Show all players if "All" phase is selected
      emit(FetchPlayersState.fetchSuccess(allPlayers));
    } else if (phase == "sub_ended") {
      final filteredPlayers =
          allPlayers.where((player) => player.remainingDuration == 0).toList();
      emit(FetchPlayersState.fetchSuccess(filteredPlayers));
    } else {
      // Filter players by the selected phase
      final filteredPlayers =
          allPlayers.where((player) => player.phase == phase).toList();
      emit(FetchPlayersState.fetchSuccess(filteredPlayers));
    }
  }
}
