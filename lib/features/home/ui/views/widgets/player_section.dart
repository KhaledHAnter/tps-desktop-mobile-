import 'package:flutter/material.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/routing/routes.dart';
import '../../../data/models/player_model.dart';
import 'player_tile.dart';

class PlayersSection extends StatelessWidget {
  final List<PlayerModel> players;
  const PlayersSection({super.key, required this.players});

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
              arguments: players[index]),
          child: PlayerTile(
            player: players[index],
          ),
        );
      },
    );
  }
}
