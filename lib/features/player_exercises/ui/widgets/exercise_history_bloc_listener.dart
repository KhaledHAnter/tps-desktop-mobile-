import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/widgets/loading_indicator.dart';
import 'package:tps/features/player_exercises/logic/cubit/exercises_cubit.dart';

import '../../../../../core/helpers/extentions.dart';
import '../../../../../core/widgets/show_snackbar.dart';

class ExerciseHistoryBlocListener extends StatelessWidget {
  const ExerciseHistoryBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExercisesCubit, ExercisesState>(
      listenWhen: (previous, current) =>
          current is AddHistoryLoading ||
          current is AddHistorySuccess ||
          current is AddHistoryError ||
          current is DeleteHistoryLoading ||
          current is DeleteHistorySuccess ||
          current is DeleteHistoryError,
      listener: (context, state) {
        state.whenOrNull(
          addHistoryLoading: () {
            showDialog(
              context: context,
              builder: (context) => const LoadingIndicator(),
            );
          },
          deleteHistoryLoading: () {
            showDialog(
              context: context,
              builder: (context) => const LoadingIndicator(),
            );
          },
          addHistorySuccess: () {
            context.pop();
            showSnackbar(context, "تم اضافة تحديث جديد", Colors.green);
          },
          deleteHistorySuccess: () {
            context.pop();
            showSnackbar(context, "تم حذف تحديث ", Colors.green);
          },
          addHistoryError: (message) {
            context.pop();
            showSnackbar(
                context, "خطأ عند اضافة تحديث :  $message", Colors.red);
          },
          deleteHistoryError: (message) {
            context.pop();
            showSnackbar(context, "خطأ عند حذف تحديث :  $message", Colors.red);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
