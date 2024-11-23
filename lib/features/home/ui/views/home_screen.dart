import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/features/home/logic/fetch_player_cubit/fetch_players_cubit.dart';
import 'widgets/app_search_bar.dart';
import 'widgets/catigory_section.dart';
import 'widgets/player_section_bloc_builder.dart';
import 'widgets/welcome_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RefreshIndicator(
            onRefresh: () => context.read<FetchPlayersCubit>().fetchPlayers(),
            color: ColorsManager.mainBage,
            displacement: 100,
            child: const CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      WelcomeHeader(),
                      Gap(16),
                      AppSearchBar(),
                      Gap(24),
                      CatigorySection(),
                      Gap(16),
                    ],
                  ),
                ),
                PlayersSectionBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
