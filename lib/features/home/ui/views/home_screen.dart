import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'widgets/app_search_bar.dart';
import 'widgets/catigory_section.dart';
import 'widgets/player_section_bloc_builder.dart';
import 'widgets/welcome_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
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
    );
  }
}
