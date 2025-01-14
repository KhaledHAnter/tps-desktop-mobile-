import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/routing/routes.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';
import 'package:tps/features/player_exercises/logic/cubit/exercises_cubit.dart';

class ExercisesListSep extends StatelessWidget {
  final List<ExerciseModel> exercises;
  const ExercisesListSep({
    super.key,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExercisesCubit>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: ColorsManager.containergray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: exercises.isEmpty
          ? const Center(child: Text("لا يوجد تمارين"))
          : ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: exercises.length,
              separatorBuilder: (context, index) => const Divider(
                height: 16,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.exerciseDetailsScreen,
                      arguments: exercises[index]);
                },
                child: Dismissible(
                  confirmDismiss: (direction) async =>
                      cubit.showDeleteConfirmationDialog(context),
                  key: UniqueKey(),
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16),
                    color: Colors.redAccent,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) => cubit.deleteHistory(
                      cubit.phone ?? "", exercises[index].name, index),
                  child: ListTile(
                    leading: const Icon(
                      Icons.fitness_center,
                      color: Colors.redAccent,
                    ),
                    title: Text(
                      exercises[index].name,
                      style: Styles.font16medium
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "${exercises[index].reps} مجموعات  -  ${exercises[index].sets} عدات",
                      style: Styles.font14medium,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
