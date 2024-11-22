import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/player_details/logic/cubit/player_details_cubit.dart';
import 'package:tps/features/player_details/ui/widgets/details_header.dart';

class PlayerDetailsScreen extends StatelessWidget {
  final PlayerModel player;
  const PlayerDetailsScreen({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlayerDetailsCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const DetailsHeader(),
              const Gap(32),
              Row(
                children: [
                  Text(
                    player.name,
                    style: Styles.font22bold,
                  ),
                  const Spacer(),
                  Text("${player.money} ج.م", style: Styles.font20medium),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  const Icon(
                    Icons.fitness_center,
                    color: ColorsManager.mainBage,
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
              ),
              const Gap(32),
              Row(
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
                  Text("${player.subsDuration} ايام",
                      style: Styles.font16medium),
                  const Spacer(),
                  const Icon(
                    Icons.history,
                    color: ColorsManager.mainBage,
                  ),
                  const Gap(4),
                  Text(cubit.formatDateTime(player.endDate),
                      style: Styles.font16medium),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
