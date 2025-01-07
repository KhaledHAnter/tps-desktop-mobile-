import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/features/player_exercises/ui/widgets/exercises_header.dart';
import 'package:tps/features/player_exercises/ui/widgets/exercises_item_container2.dart';

class PlayerExercisesScreen extends StatelessWidget {
  final String phone;
  const PlayerExercisesScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ExercisesHeader(
                  phone: phone,
                ),
                const Gap(18),
                const ExercisesItemContainer2(),
                // Gap(12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
