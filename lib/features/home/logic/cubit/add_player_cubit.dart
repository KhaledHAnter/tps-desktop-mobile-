import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tps/features/home/data/repos/add_player_repo.dart';
import 'package:tps/features/home/logic/cubit/add_player_state.dart';

class AddPlayerCubit extends Cubit<AddPlayerState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sportController = TextEditingController();
  final TextEditingController phaseController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final AddPlayerRepo addPlayerRepo;

  AddPlayerCubit(this.addPlayerRepo) : super(const AddPlayerState.initial());

  /// Add a new player
  Future<void> addPlayer() async {
    final name = nameController.text;
    final sport = sportController.text;
    final phase = phaseController.text;
    final phone = int.tryParse(phoneController.text) ?? 0;
    final money = int.tryParse(moneyController.text) ?? 0;
    final duration = int.tryParse(durationController.text) ?? 0;
    final description = descriptionController.text;

    final player = addPlayerRepo.createPlayer(
      name: name,
      sport: sport,
      phase: phase,
      phone: phone,
      money: money,
      duration: duration,
      description: description,
      freeze: null, // Optional: Add FreezeModel if needed
    );

    emit(const AddPlayerState.loading());
    final response = await addPlayerRepo.savePlayer(player);

    response.when(
      success: () => emit(
        const AddPlayerState.success(),
      ),
      error: (errMessage) => emit(
        AddPlayerState.error(errMessage),
      ),
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    sportController.dispose();
    durationController.dispose();
    moneyController.dispose();
    phoneController.dispose();
    phaseController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
