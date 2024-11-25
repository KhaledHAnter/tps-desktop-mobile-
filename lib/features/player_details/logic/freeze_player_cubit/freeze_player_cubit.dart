import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tps/features/home/data/models/freeze_model.dart';
import 'package:tps/features/player_details/data/repos/freeze_player_repo.dart';

part 'freeze_player_state.dart';
part 'freeze_player_cubit.freezed.dart';

class FreezePlayerCubit extends Cubit<FreezePlayerState> {
  final FreezePlayerRepo _repository;
  FreezePlayerCubit(this._repository)
      : super(const FreezePlayerState.initial());

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController freezeReasonController = TextEditingController();
  final TextEditingController freezeDaysController = TextEditingController();

  /// Add a freeze to the player's subscription
  Future<void> freezePlayerSubscription(String documentId) async {
    if (!formKey.currentState!.validate()) return;
    emit(const FreezePlayerState.freezeLoading());
    try {
      await _repository.addPlayerFreeze(
          documentId,
          int.tryParse(freezeDaysController.text) ?? 0,
          freezeReasonController.text);
      emit(const FreezePlayerState.freezeSuccess());
    } catch (e) {
      emit(FreezePlayerState.freezeError(e.toString()));
    }
  }

  Future<void> deletePlayerFreeze(
      String documentId, int freezeIndex, FreezeModel freeze) async {
    emit(const FreezePlayerState.freezeLoading());
    try {
      await _repository.deletePlayerFreeze(documentId, freezeIndex, freeze);
      emit(const FreezePlayerState.unFreezeSuccess());
    } catch (e) {
      emit(FreezePlayerState.freezeError(e.toString()));
    }
  }
}
