import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tps/features/player_details/data/repos/delete_player_repo.dart';

part 'delete_player_state.dart';
part 'delete_player_cubit.freezed.dart';

class DeletePlayerCubit extends Cubit<DeletePlayerState> {
  DeletePlayerCubit(this._repository)
      : super(const DeletePlayerState.initial());

  final DeletePlayerRepo _repository;

  /// Delete player by document ID
  Future<void> deletePlayer(String documentId) async {
    emit(const DeletePlayerState.deleteLoading());
    final result = await _repository.deletePlayer(documentId);

    result.when(
      success: () {
        emit(const DeletePlayerState.deleteSuccess());
      },
      error: (message) {
        emit(DeletePlayerState.deleteError(message));
      },
    );
  }
}
