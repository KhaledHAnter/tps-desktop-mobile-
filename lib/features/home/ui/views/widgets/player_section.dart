import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/routing/routes.dart';

import '../../../data/models/player_model.dart';
import 'player_tile.dart';

class PlayersSection extends StatelessWidget {
  final List<PlayerModel> players;
  final bool showMoney;
  static List<String> names = [
    'خالد عنتر',
    'محمد البسيوني',
    'احمد عبدالله',
    'زياد الحسيني',
    'طارق رجب',
    'ادهم خالد',
    'محمد محمود',
    'طه محمد',
    'محمود عادل',
    'كريم الظابط'
  ];
  static List<String> sports = [
    'سباحة',
    'كرة القدم',
    'كرة السلة',
    'كياك',
    'بوكسينج',
  ];
  static List<PlayerModel> dummyPlayers = List.generate(
    10,
    (index) => PlayerModel(
      shouldShowReminder: false,
      age: index + 20,
      description: null,
      endDate: DateTime.now(),
      freeze: null,
      money: (index + 1) * 600,
      name: names[index],
      phase: 'under_exam1',
      phone: '201012343087',
      remainingDuration: 0,
      startDate: DateTime.now(),
      sport: Random().nextBool()
          ? sports[Random().nextInt(sports.length)]
          : 'null',
      subsDuration: Random().nextInt(10) + 1,
    ),
  );
  const PlayersSection(
      {super.key, required this.players, required this.showMoney});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    int crossAxisCount = width < 400 ? 2 : width ~/ 200;
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.pushNamed(Routes.palyerDetailsScreen,
              arguments: {'player': players[index], 'showMoney': showMoney}),
          child: PlayerTile(
            player: players[index],
            showMoney: showMoney,
          ),
        );
      },
    );
  }
}
