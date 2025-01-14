import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/widgets/loading_indicator.dart';
import 'package:tps/features/player_exercises/logic/cubit/exercises_cubit.dart';
import 'package:tps/features/player_exercises/ui/widgets/exercises_list_sep.dart';

class ExercisesItemContainer2 extends StatelessWidget {
  const ExercisesItemContainer2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExercisesCubit, ExercisesState>(
      buildWhen: (previous, current) =>
          current is FecthLoading ||
          current is FecthSuccess ||
          current is FecthError,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          fecthLoading: () => const LoadingIndicator(),
          fecthSuccess: (exercises) => ExercisesListSep(
            exercises: exercises,
          ),
          fecthError: (message) => Text(message),
        );
      },
    );
  }
}
