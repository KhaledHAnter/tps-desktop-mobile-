import 'package:flutter/material.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_bar_button.dart';

class StatisticsHeader extends StatelessWidget {
  const StatisticsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarButton(
          icon: Icons.arrow_back_ios_new,
          onTap: () => context.pop(),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "إحصائيات التمارين",
              style: Styles.font24bold,
            ),
          ),
        ),
        const SizedBox(width: 48),
      ],
    );
  }
}
