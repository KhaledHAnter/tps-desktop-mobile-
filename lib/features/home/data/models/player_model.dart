import 'freeze_model.dart';

class PlayerModel {
  final String name, sport, phase, phone;
  final String? description;
  final int money, subsDuration, remainingDuration, age;
  final DateTime startDate, endDate;
  final List<FreezeModel>? freeze;

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
    required this.age,
  });
}
