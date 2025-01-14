import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/widgets/loading_indicator.dart';
import 'package:tps/features/player_exercises/logic/cubit/exercises_cubit.dart';

import '../../../../../core/helpers/extentions.dart';
import '../../../../../core/widgets/show_snackbar.dart';

class DeleteExerciseBlocListener extends StatelessWidget {
  final String phone;
  const DeleteExerciseBlocListener({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExercisesCubit, ExercisesState>(
      listenWhen: (previous, current) =>
          current is DeleteLoading ||
          current is DeleteSuccess ||
          current is DeleteError,
      listener: (context, state) {
        state.whenOrNull(
          deleteLoading: () => showDialog(
            context: context,
            builder: (context) => const LoadingIndicator(),
          ),
          deleteSuccess: () {
            context.pop();
            showSnackbar(context, "تم حذف التمرين", Colors.green);
            context.read<ExercisesCubit>().fetchExercises(phone);
          },
          deleteError: (message) {
            context.pop();
            showSnackbar(
                context, "خطاء عند حذف التمرين :  $message", Colors.red);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
