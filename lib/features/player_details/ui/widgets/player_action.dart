import 'package:flutter/material.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/player_details/data/models/player_action_buttons_model.dart';

class PlayerAction extends StatelessWidget {
  final PlayerActionButtonsModel model;
  const PlayerAction({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onTap,
      child: SizedBox(
        child: Column(
          children: [
            Icon(
              model.icon,
              color: ColorsManager.mainBage,
              size: 32,
            ),
            Text(
              model.title,
              style: Styles.font14medium,
            )
          ],
        ),
      ),
    );
  }
}
