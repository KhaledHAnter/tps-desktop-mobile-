import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/player_exercises/ui/widgets/change_number_circle_avatar.dart';

class RecordNewReps extends StatefulWidget {
  final int reps;
  const RecordNewReps({
    super.key,
    required this.reps,
  });

  @override
  State<RecordNewReps> createState() => _RecordNewWeightState();
}

class _RecordNewWeightState extends State<RecordNewReps> {
  int reps = 0;
  @override
  void initState() {
    reps = widget.reps;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              setState(() {
                reps++;
              });
            },
          ),
          const Spacer(),
          Text(
            "$reps عدات",
            style: Styles.font16medium,
          ),
          const Spacer(),
          ChangeNumberCircleAvatar(
            number: 1,
            onTap: () {
              setState(() {
                reps--;
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
