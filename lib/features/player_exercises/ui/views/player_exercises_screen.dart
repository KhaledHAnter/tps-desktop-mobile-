import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/features/player_exercises/logic/cubit/exercises_cubit.dart';
import 'package:tps/features/player_exercises/ui/widgets/delete_exercise_bloc_listener.dart';
import 'package:tps/features/player_exercises/ui/widgets/exercises_header.dart';
import 'package:tps/features/player_exercises/ui/widgets/exercises_item_container2.dart';

class PlayerExercisesScreen extends StatelessWidget {
  final String phone;
  const PlayerExercisesScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    context.read<ExercisesCubit>().phone = phone;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ExercisesHeader(
                phone: phone,
              ),
              const Gap(18),
              const ExercisesItemContainer2(),
              DeleteExerciseBlocListener(phone: phone),
            ],
          ),
        ),
      ),
    );
  }
}
