import 'package:flutter/material.dart';
import 'package:tps/core/theming/colors.dart';

class GrayContainer extends StatelessWidget {
  final Widget? child;
  const GrayContainer({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: ColorsManager.containergray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
