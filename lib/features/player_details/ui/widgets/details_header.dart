import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_bar_button.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/home/ui/views/widgets/bottom_sheet_body.dart';
import 'package:tps/features/player_details/logic/edit_player_cubit/edit_player_cubit.dart';
import 'package:tps/features/player_details/ui/widgets/edit_bottom_sheet_body.dart';
import 'package:tps/generated/l10n.dart';

class DetailsHeader extends StatelessWidget {
  final PlayerModel player;
  const DetailsHeader({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarButton(
          icon: Icons.arrow_back_ios_new,
          onTap: () => context.pop(),
        ),
        const Spacer(),
        Text(
          S.of(context).details_head,
          style: Styles.font24bold,
        ),
        const Spacer(),
        AppBarButton(
          icon: Icons.edit,
          onTap: () => showPlayerEditSheet(context),
        ),
      ],
    );
  }

  PersistentBottomSheetController showPlayerEditSheet(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (_) {
          return BlocProvider(
            create: (context) => EditPlayerCubit(),
            child: Builder(builder: (context) {
              return EditBottomSheetBody(
                player: player,
              );
            }),
          );
        });
  }
}
