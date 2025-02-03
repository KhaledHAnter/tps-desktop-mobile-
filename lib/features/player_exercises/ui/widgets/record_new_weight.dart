import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/player_exercises/logic/cubit/exercises_cubit.dart';
import 'package:tps/features/player_exercises/ui/widgets/change_number_circle_avatar.dart';

class RecordNewWeight extends StatefulWidget {
  const RecordNewWeight({
    super.key,
  });

  @override
  State<RecordNewWeight> createState() => _RecordNewWeightState();
}

class _RecordNewWeightState extends State<RecordNewWeight> {
  double weight = 0;
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
      child: Column(
        children: [
          Text(
            "${cubit.weight} كجم",
            style: Styles.font20bold,
          ),
          const Gap(8),
          Row(
            children: <Widget>[
              const Icon(
                Icons.add,
                color: Colors.green,
              ),
              const Gap(8),
              ChangeNumberCircleAvatar(
                  number: 5,
                  onTap: () {
                    cubit.incrementWeight(5);
                    setState(() {
                      weight = cubit.weight!;
                    });
                  }),
              const Gap(4),
              ChangeNumberCircleAvatar(
                number: 1,
                onTap: () {
                  cubit.incrementWeight(1);
                  setState(() {
                    weight = cubit.weight!;
                  });
                },
              ),
              const Gap(4),
              ChangeNumberCircleAvatar(
                number: 0.5,
                onTap: () {
                  cubit.incrementWeight(0.5);
                  setState(() {
                    weight = cubit.weight!;
                  });
                },
              ),
              const Spacer(),
              const Spacer(),
              ChangeNumberCircleAvatar(
                number: 0.5,
                onTap: () {
                  cubit.decrementWeight(0.5);
                  setState(() {
                    weight = cubit.weight!;
                  });
                },
              ),
              const Gap(4),
              ChangeNumberCircleAvatar(
                number: 1,
                onTap: () {
                  cubit.decrementWeight(1);
                  setState(() {
                    weight = cubit.weight!;
                  });
                },
              ),
              const Gap(4),
              ChangeNumberCircleAvatar(
                number: 5,
                onTap: () {
                  cubit.decrementWeight(5);
                  setState(() {
                    weight = cubit.weight!;
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
        ],
      ),
    );
  }
}
