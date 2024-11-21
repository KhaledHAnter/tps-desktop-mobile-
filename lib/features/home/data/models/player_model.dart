import 'package:tps/features/home/data/models/freeze_model.dart';

class PlayerModel {
  final String name, sport, phase;
  final int phone, money, subsDuration;
  final DateTime startDate, endDate;
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
  });
}
