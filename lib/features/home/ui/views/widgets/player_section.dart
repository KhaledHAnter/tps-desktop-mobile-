import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/data/models/player_model.dart';

class PlayersSection extends StatelessWidget {
  final void Function()? onTap;
  final List<PlayerModel> players;
  const PlayersSection({super.key, this.onTap, required this.players});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: onTap,
          child: PlayerTile(
            player: players[index],
          ),
        );
      },
    );
  }
}

class PlayerTile extends StatelessWidget {
  final PlayerModel player;
  const PlayerTile({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: ColorsManager.containergray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            player.name,
            style: Styles.font16medium.copyWith(fontWeight: FontWeight.w600),
          ),
          const Gap(4),
          Text(
            player.sport,
            style: Styles.font16medium,
          ),
          const Gap(4),
          Text(
            player.phase,
            style: Styles.font14medium,
          ),
          const Spacer(
            flex: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text("${player.money}ج.م", style: Styles.font14medium),
                const Spacer(),
                Text(
                  "${player.remainingDuration}يوم",
                  style: Styles.font14medium.copyWith(color: Colors.redAccent),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
