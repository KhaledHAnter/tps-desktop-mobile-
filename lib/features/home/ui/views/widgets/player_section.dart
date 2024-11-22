import 'package:flutter/material.dart';
import 'package:tps/features/home/data/models/category_model.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/home/ui/views/widgets/player_tile.dart';
import 'package:tps/generated/l10n.dart';

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
