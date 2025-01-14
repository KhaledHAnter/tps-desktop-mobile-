import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/player_exercises/logic/cubit/exercises_cubit.dart';
import 'package:tps/features/player_exercises/ui/widgets/change_number_circle_avatar.dart';

class RecordNewSets extends StatefulWidget {
  const RecordNewSets({super.key});

  @override
  State<RecordNewSets> createState() => _RecordNewWeightState();
}

class _RecordNewWeightState extends State<RecordNewSets> {
  int sets = 0;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExercisesCubit>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.add,
            color: Colors.green,
          ),
          const Gap(8),
          ChangeNumberCircleAvatar(
            number: 1,
            onTap: () {
              cubit.incrementSets(1);
              setState(() {
                sets = cubit.sets!;
              });
            },
          ),
          const Spacer(),
          Text(
            "${cubit.sets} مجموعة",
            style: Styles.font16medium,
          ),
          const Spacer(),
          ChangeNumberCircleAvatar(
            number: 1,
            onTap: () {
              cubit.decrementSets(1);
              setState(() {
                sets = cubit.sets!;
              });
            },
          ),
          const Gap(8),
          const Icon(
            Icons.remove,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
