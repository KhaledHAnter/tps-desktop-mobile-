import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/generated/l10n.dart';

class PlayerDescription extends StatelessWidget {
  final String description;
  const PlayerDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: ColorsManager.containergray,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).details_desc,
              style: Styles.font16medium,
            ),
            const Gap(8),
            description == ""
                ? Text(
                    S.of(context).details_no_desc,
                    style: Styles.font14medium,
                  )
                : Text(
                    description,
                    style: Styles.font14medium,
                  )
          ],
        ));
  }
}
