import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_player_state.dart';
part 'edit_player_cubit.freezed.dart';

class EditPlayerCubit extends Cubit<EditPlayerState> {
  EditPlayerCubit() : super(const EditPlayerState.initial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController sportController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  late String phaseController;
  late DateTime startDate;
  final TextEditingController durationController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  /// Update player details in Firestore
  Future<void> updatePlayerDetails(String documentId) async {
    emit(const EditPlayerState.editLoading());
    if (!formKey.currentState!.validate()) {
      emit(const EditPlayerState.editError('Invalid form data.'));
      return;
    }

    final dataToUpdate = {
      'name': nameController.text,
      'sport': sportController.text,
      'phase': phaseController,
      'money': int.tryParse(moneyController.text) ?? 0,
      'subsDuration': int.tryParse(durationController.text) ?? 0,
      'age': int.tryParse(ageController.text) ?? 0,
      'startDate': startDate.toIso8601String(),
      'endDate': startDate
          .add(Duration(days: int.tryParse(durationController.text)!))
          .toIso8601String(),
      'description': descriptionController.text,
    };

    try {
      await FirebaseFirestore.instance
          .collection('players')
          .doc(documentId) // The player's phone as the document ID
          .update(dataToUpdate);
      emit(const EditPlayerState.editSuccess());
    } catch (e) {
      emit(EditPlayerState.editError('Failed to update player: $e'));
    }
  }
}
