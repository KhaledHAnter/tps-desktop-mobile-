import 'freeze_model.dart';

class PlayerModel {
  final String name, sport, phase, phone;
  final String? description;
  final int money, subsDuration, remainingDuration, age;
  final DateTime startDate, endDate;
  final List<FreezeModel>? freeze;
  final bool shouldShowReminder;

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
    required this.shouldShowReminder,
  });

  PlayerModel copyWith({bool? shouldShowReminder}) {
    return PlayerModel(
      name: name,
      age: age,
      sport: sport,
      phase: phase,
      phone: phone,
      money: money,
      subsDuration: subsDuration,
      startDate: startDate,
      endDate: endDate,
      remainingDuration: remainingDuration,
      description: description,
      freeze: freeze,
      shouldShowReminder: shouldShowReminder ?? this.shouldShowReminder,
    );
  }
}
