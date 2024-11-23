import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/player_details/data/repos/fetch_single_player_repo.dart';

part 'fetch_single_player_state.dart';
part 'fetch_single_player_cubit.freezed.dart';

class FetchSinglePlayerCubit extends Cubit<FetchSinglePlayerState> {
  final FetchSinglePlayerRepo repository;
  FetchSinglePlayerCubit(this.repository)
      : super(const FetchSinglePlayerState.initial());

  Future<void> fetchPlayerDetails(String documentId) async {
    emit(const FetchSinglePlayerState.fetchLoading());
    final result = await repository.fetchPlayerById(documentId);

    result.when(
      success: (player) {
        emit(FetchSinglePlayerState.fetchSuccess(player));
      },
      error: (message) {
        emit(FetchSinglePlayerState.fetchError(message));
      },
    );
  }
}
