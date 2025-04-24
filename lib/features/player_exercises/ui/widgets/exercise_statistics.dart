import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/gray_container.dart';

class ExerciseStatistics extends StatelessWidget {
  final String exerciseName;
  final void Function()? onTap;
  const ExerciseStatistics({
    super.key,
    required this.exerciseName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GrayContainer(
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.analytics_outlined,
              color: ColorsManager.mainBage,
            ),
            const Gap(8),
            Text(
              exerciseName,
              style: Styles.font16medium,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: ColorsManager.mainBage,
            ),
          ],
        ),
      ),
    );
  }
}
