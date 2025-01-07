import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/widgets/loading_indicator.dart';
import 'package:tps/features/player_exercises/logic/cubit/add_exercise_cubit.dart';

import '../../../../../core/helpers/extentions.dart';
import '../../../../../core/widgets/show_snackbar.dart';

class AddExerciseBlocListener extends StatelessWidget {
  const AddExerciseBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddExerciseCubit, AddExerciseState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const LoadingIndicator(),
            );
          },
          success: () {
            context.pop();
            context.pop();
            showSnackbar(context, "تم اضافة تمرين جديد", Colors.green);
            // context.read<FetchPlayersCubit>().fetchPlayers();
          },
          error: (message) {
            context.pop();
            showSnackbar(
                context, "خطأ عند اضافة تمرين :  $message", Colors.red);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
