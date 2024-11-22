import 'package:flutter/material.dart';
import '../../../data/models/player_model.dart';
import 'player_tile.dart';

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
