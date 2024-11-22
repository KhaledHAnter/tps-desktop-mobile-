import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/features/home/logic/fetch_player_cubit/fetch_players_cubit.dart';
import 'package:tps/features/home/ui/views/widgets/player_section.dart';

class PlayersSectionBlocBuilder extends StatelessWidget {
  const PlayersSectionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPlayersCubit, FetchPlayersState>(
        buildWhen: (previous, current) =>
            current is FetchError ||
            current is FetchSuccess ||
            current is FetchLoading,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const SliverToBoxAdapter(child: SizedBox.shrink());
            },
            fetchLoading: () => SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: ColorsManager.mainBage, size: 100),
              ),
            ),
            fetchError: (message) =>
                const SliverToBoxAdapter(child: SizedBox.shrink()),
            fetchSuccess: (players) => PlayersSection(
              players: players,
            ),
          );
        });
  }
}
