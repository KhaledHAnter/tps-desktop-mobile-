import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tps/features/home/data/models/player_model.dart';

part 'add_days_state.dart';
part 'add_days_cubit.freezed.dart';

class AddDaysCubit extends Cubit<AddDaysState> {
  AddDaysCubit() : super(const AddDaysState.initial());

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();

  Future<void> addDays(String documentId, PlayerModel player) async {
    emit(const AddDaysState.addDaysLoading());
    if (!formKey.currentState!.validate()) {
      emit(const AddDaysState.addDaysError('Invalid form data.'));
      return;
    }

    int initMoney = player.money;
    int initDuration = player.subsDuration;
    int newMoney = int.tryParse(moneyController.text) ?? 0;
    int newDuration = int.tryParse(durationController.text) ?? 0;

    int money = initMoney + newMoney;
    int duration = initDuration + newDuration;

    final dataToUpdate = {
      'money': money,
      'subsDuration': duration,
      'endDate':
          player.startDate.add(Duration(days: duration)).toIso8601String(),
    };

    try {
      log("$initMoney $newMoney $money $initDuration $newDuration $duration");
      await FirebaseFirestore.instance
          .collection('players')
          .doc(documentId) // The player's phone as the document ID
          .update(dataToUpdate);
      emit(const AddDaysState.addDaysSuccess());
    } catch (e) {
      emit(AddDaysState.addDaysError('Failed to update player: $e'));
    }
  }
}
