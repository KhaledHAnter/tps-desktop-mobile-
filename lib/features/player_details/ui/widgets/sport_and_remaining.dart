import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/data/models/player_model.dart';

class SportAndRemaining extends StatelessWidget {
  const SportAndRemaining({
    super.key,
    required this.player,
  });

  final PlayerModel player;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.sports_soccer_outlined,
          color: Colors.redAccent,
        ),
        const Gap(4),
        Text(player.sport, style: Styles.font20bold),
        const Spacer(),
        const Icon(
          Icons.local_fire_department_outlined,
          color: Colors.redAccent,
        ),
        const Gap(4),
        Text("باقي ${player.remainingDuration} ايام",
            style: Styles.font20medium),
      ],
    );
  }
}
