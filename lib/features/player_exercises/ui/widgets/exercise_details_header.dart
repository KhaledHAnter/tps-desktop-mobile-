
import 'package:flutter/material.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_bar_button.dart';

class ExersiceDetailsHeader extends StatelessWidget {
  final String exerciseName;
  const ExersiceDetailsHeader({super.key, required this.exerciseName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarButton(
          icon: Icons.arrow_back_ios_new,
          onTap: () => context.pop(),
        ),
        const Spacer(
          flex: 3,
        ),
        Text(
          exerciseName,
          style: Styles.font24bold,
        ),
        const Spacer(
          flex: 4,
        ),
      ],
    );
  }
}
