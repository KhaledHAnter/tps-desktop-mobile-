import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/repos/add_player_repo.dart';
import 'add_player_state.dart';

class AddPlayerCubit extends Cubit<AddPlayerState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController sportController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  String phaseController = '';
  final TextEditingController durationController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final AddPlayerRepo addPlayerRepo;

  AddPlayerCubit(this.addPlayerRepo) : super(const AddPlayerState.initial());

  /// Add a new player
  Future<void> addPlayer() async {
    if (formKey.currentState!.validate()) {
      final name = nameController.text;
      final sport = sportController.text;
      final phase = phaseController;
      final phone = phoneController.text;
      final money = int.tryParse(moneyController.text) ?? 0;
      final duration = int.tryParse(durationController.text) ?? 0;
      final description = descriptionController.text;
      final age = int.tryParse(ageController.text) ?? 0;

      final player = addPlayerRepo.createPlayer(
        name: name,
        age: age,
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
  }

  Future<void> pasteText() async {
    try {
      final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
      phoneController.text = clipboardData?.text ?? "00";
    } catch (e) {
      phoneController.text = "00";
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    sportController.dispose();
    durationController.dispose();
    moneyController.dispose();
    phoneController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
