import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/player_exercises/ui/widgets/change_number_circle_avatar.dart';

class RecordNewSets extends StatefulWidget {
  final int sets;
  const RecordNewSets({
    super.key,
    required this.sets,
  });

  @override
  State<RecordNewSets> createState() => _RecordNewWeightState();
}

class _RecordNewWeightState extends State<RecordNewSets> {
  int sets = 0;
  @override
  void initState() {
    sets = widget.sets;
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
                sets++;
              });
            },
          ),
          const Spacer(),
          Text(
            "$sets مجموعة",
            style: Styles.font16medium,
          ),
          const Spacer(),
          ChangeNumberCircleAvatar(
            number: 1,
            onTap: () {
              setState(() {
                sets--;
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
