import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/player_details/logic/player_details_cubit/player_details_cubit.dart';

class PlayerPeriod extends StatelessWidget {
  const PlayerPeriod({
    super.key,
    required this.player,
  });

  final PlayerModel player;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlayerDetailsCubit>();
    return Row(
      children: <Widget>[
        const Icon(
          Icons.update,
          color: ColorsManager.mainBage,
        ),
        const Gap(4),
        Text(cubit.formatDateTime(player.startDate),
            style: Styles.font16medium),
        const Spacer(),
        const Icon(
          Icons.schedule,
          color: ColorsManager.mainBage,
        ),
        const Gap(4),
        Text("${player.subsDuration} ايام", style: Styles.font16medium),
        const Spacer(),
        const Icon(
          Icons.history,
          color: ColorsManager.mainBage,
        ),
        const Gap(4),
        Text(cubit.formatDateTime(player.endDate), style: Styles.font16medium),
      ],
    );
  }
}
