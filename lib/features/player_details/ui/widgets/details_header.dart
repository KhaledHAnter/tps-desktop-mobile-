import 'package:flutter/material.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_bar_button.dart';
import 'package:tps/generated/l10n.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarButton(
          icon: Icons.arrow_back_ios_new,
          onTap: () => context.pop(),
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          S.of(context).details_head,
          style: Styles.font24bold,
        ),
        const Spacer(
          flex: 3,
        ),
      ],
    );
  }
}
