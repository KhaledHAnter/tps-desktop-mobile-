import 'package:flutter/material.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/ui/views/widgets/chat_notify_banner.dart';
import 'package:tps/features/player_details/data/models/player_action_buttons_model.dart';

class PlayerAction extends StatelessWidget {
  final PlayerActionButtonsModel model;
  final bool show;
  const PlayerAction({super.key, required this.model, required this.show});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: model.onTap,
      child: Stack(
        children: [
          ChatNotifyBanner(show: show, size: 10),
          SizedBox(
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
        ],
      ),
    );
  }
}
