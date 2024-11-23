import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/player_details/ui/widgets/details_header.dart';
import 'package:tps/features/player_details/ui/widgets/fetch_single_player_bloc_listener.dart';
import 'package:tps/features/player_details/ui/widgets/freezr_list.dart';
import 'package:tps/features/player_details/ui/widgets/name_and_money.dart';
import 'package:tps/features/player_details/ui/widgets/player_description.dart';
import 'package:tps/features/player_details/ui/widgets/player_period.dart';
import 'package:tps/features/player_details/ui/widgets/player_phase.dart';
import 'package:tps/features/player_details/ui/widgets/sport_and_remaining.dart';
import 'package:tps/generated/l10n.dart';

class PlayerDetailsScreen extends StatelessWidget {
  final PlayerModel player;
  const PlayerDetailsScreen({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DetailsHeader(
                  player: player,
                ),
                const Gap(32),
                NameAndMoney(player: player),
                const Gap(16),
                SportAndRemaining(player: player),
                const Gap(32),
                PlayerPeriod(player: player),
                const Gap(32),
                PlayerPhase(player: player),
                const Gap(32),
                FreezeList(
                  freezes: player.freeze ?? [],
                ),
                const Gap(16),
                PlayerDescription(
                  description: player.description ?? "",
                ),
                const FetchSinglePlayerBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
