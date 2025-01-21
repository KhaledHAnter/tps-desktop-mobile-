import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/data/models/player_model.dart';

class NameAndMoney extends StatelessWidget {
  final PlayerModel player;
  final bool showMoney;
  const NameAndMoney({
    super.key,
    required this.player,
    required this.showMoney,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          player.name,
          style: Styles.font22bold,
        ),
        const Gap(8),
        Text(
          " - ${player.age} سنة",
          style: Styles.font20medium,
        ),
        const Spacer(),
        Text(showMoney ? "${player.money} ج.م" : "***** ج.م",
            style: Styles.font20medium),
      ],
    );
  }
}
