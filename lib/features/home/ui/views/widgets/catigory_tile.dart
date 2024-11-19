import 'package:flutter/material.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      // width: MediaQuery.sizeOf(context).width / 2 - 32,
      decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.mainBage.withOpacity(0.3)
              : ColorsManager.containergray,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          title,
          style: Styles.font14medium,
        ),
      ),
    );
  }
}
