import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/di/dependency_injection.dart';
import 'package:tps/core/widgets/show_delete_confirm_dialog.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/player_details/data/models/player_action_buttons_model.dart';
import 'package:tps/features/player_details/logic/add_days_cubit/add_days_cubit.dart';
import 'package:tps/features/player_details/logic/delete_player_cubit/delete_player_cubit.dart';
import 'package:tps/features/player_details/logic/freeze_player_cubit/freeze_player_cubit.dart';
import 'package:tps/features/player_details/logic/player_details_cubit/player_details_cubit.dart';
import 'package:tps/features/player_details/ui/widgets/add_days_bottom_sheet.dart';
import 'package:tps/features/player_details/ui/widgets/freeze_player_bottom_sheet.dart';
import 'package:tps/features/player_details/ui/widgets/player_action.dart';
import 'package:tps/generated/l10n.dart';

class PlayerActionButtons extends StatelessWidget {
  final PlayerModel player;
  const PlayerActionButtons({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    List<PlayerActionButtonsModel> buttons = [
      PlayerActionButtonsModel(
        icon: Icons.ac_unit,
        title: S.of(context).actions_freeze,
        onTap: () => showFreezeSheet(context),
      ),
      PlayerActionButtonsModel(
        icon: Icons.trending_up,
        title: S.of(context).actions_add_days,
        onTap: () => showAddDaysSheet(context),
      ),
      PlayerActionButtonsModel(
        icon: Icons.chat_bubble_outline_rounded,
        title: S.of(context).actions_whatsapp,
        onTap: () => context
            .read<PlayerDetailsCubit>()
            .sendMessageOnWhatsApp(player.phone, ''),
      ),
      PlayerActionButtonsModel(
        icon: Icons.delete_outline,
        title: S.of(context).actions_delete,
        onTap: () async {
          final confirmed = await showDeleteConfirmationDialog(context);
          if (!confirmed) return;
          context.read<DeletePlayerCubit>().deletePlayer(player.phone);
        },
      ),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          buttons.length, (index) => PlayerAction(model: buttons[index])),
    );
  }

  PersistentBottomSheetController showAddDaysSheet(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (_) {
          return BlocProvider(
            create: (context) => AddDaysCubit(),
            child: Builder(builder: (context) {
              return AddDaysBottomSheet(
                player: player,
              );
            }),
          );
        });
  }

  PersistentBottomSheetController showFreezeSheet(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (_) {
          return BlocProvider(
            create: (context) => getIt<FreezePlayerCubit>(),
            child: Builder(builder: (context) {
              return FreezePlayerBottomSheet(
                player: player,
              );
            }),
          );
        });
  }
}
