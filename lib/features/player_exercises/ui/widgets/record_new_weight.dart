import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/player_exercises/ui/widgets/change_number_circle_avatar.dart';

class RecordNewWeight extends StatefulWidget {
  final int weight;
  const RecordNewWeight({
    super.key,
    required this.weight,
  });

  @override
  State<RecordNewWeight> createState() => _RecordNewWeightState();
}

class _RecordNewWeightState extends State<RecordNewWeight> {
  int weight = 0;
  @override
  void initState() {
    weight = widget.weight;
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
            number: 5,
            onTap: () {
              setState(() {
                weight += 5;
              });
            },
          ),
          const Gap(4),
          ChangeNumberCircleAvatar(
            number: 1,
            onTap: () {
              setState(() {
                weight++;
              });
            },
          ),
          const Spacer(),
          Text(
            "$weight كجم",
            style: Styles.font16medium,
          ),
          const Spacer(),
          ChangeNumberCircleAvatar(
            number: 5,
            onTap: () {
              setState(() {
                weight -= 5;
              });
            },
          ),
          const Gap(4),
          ChangeNumberCircleAvatar(
            number: 1,
            onTap: () {
              setState(() {
                weight--;
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
