import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/features/home/ui/views/widgets/app_search_bar.dart';
import 'package:tps/features/home/ui/views/widgets/catigory_section.dart';
import 'package:tps/features/home/ui/views/widgets/player_section.dart';
import 'package:tps/features/home/ui/views/widgets/welcome_header.dart';
import 'package:tps/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const WelcomeHeader(),
                    const Gap(16),
                    const AppSearchBar(),
                    const Gap(24),
                    CatigorySection(
                      cards: [
                        S.of(context).home_cat1,
                        S.of(context).home_cat2,
                        S.of(context).home_cat3,
                        S.of(context).home_cat4,
                        S.of(context).home_cat5,
                        S.of(context).home_cat6
                      ],
                    ),
                    const Gap(16),
                  ],
                ),
              ),
              const PlayersSection(),
            ],
          ),
        ),
      ),
    );
  }
}
