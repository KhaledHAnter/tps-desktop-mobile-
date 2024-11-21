import 'package:tps/features/home/data/models/freeze_model.dart';

class PlayerModel {
  final String name, sport, phase;
  final String? description;
  final int phone, money, subsDuration;
  final DateTime startDate, endDate, remainingDuration;
  final FreezeModel? freeze;

  PlayerModel({
    required this.name,
    required this.sport,
    required this.phase,
    required this.phone,
    required this.money,
    required this.subsDuration,
    required this.startDate,
    required this.endDate,
    this.freeze,
    required this.remainingDuration,
    this.description,
  });
}
