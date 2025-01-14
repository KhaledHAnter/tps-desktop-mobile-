import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/widgets/loading_indicator.dart';
import 'package:tps/features/player_exercises/logic/cubit/exercises_cubit.dart';

import '../../../../../core/helpers/extentions.dart';
import '../../../../../core/widgets/show_snackbar.dart';

class AddExerciseBlocListener extends StatelessWidget {
  final String phone;
  const AddExerciseBlocListener({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExercisesCubit, ExercisesState>(
      listenWhen: (previous, current) =>
          current is AddLoading || current is AddSuccess || current is AddError,
      listener: (context, state) {
        state.whenOrNull(
          addLoading: () {
            showDialog(
              context: context,
              builder: (context) => const LoadingIndicator(),
            );
          },
          addSuccess: () {
            context.pop();
            context.pop();
            showSnackbar(context, "تم اضافة تمرين جديد", Colors.green);
            context.read<ExercisesCubit>().fetchExercises(phone);
          },
          addError: (message) {
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
