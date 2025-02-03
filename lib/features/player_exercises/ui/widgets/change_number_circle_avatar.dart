import 'package:flutter/material.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';

class ChangeNumberCircleAvatar extends StatelessWidget {
  final double number;
  final void Function()? onTap;

  const ChangeNumberCircleAvatar({
    super.key,
    required this.number,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: ColorsManager.containergray,
        radius: 20,
        child: Text(
          "$number",
          style: Styles.font16medium,
        ),
      ),
    );
  }
}
