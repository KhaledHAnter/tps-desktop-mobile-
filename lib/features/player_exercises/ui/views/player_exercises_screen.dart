import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/features/player_exercises/ui/widgets/exercises_header.dart';
import 'package:tps/features/player_exercises/ui/widgets/exercises_item_container.dart';

class PlayerExercisesScreen extends StatelessWidget {
  const PlayerExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ExercisesHeader(),
                Gap(18),
                ExercisesItemContainer(),
                Gap(12),
                ExercisesItemContainer(),
                Gap(12),
                ExercisesItemContainer(),
                Gap(12),
                ExercisesItemContainer(),
                Gap(12),
                ExercisesItemContainer(),
                Gap(12),
                ExercisesItemContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
