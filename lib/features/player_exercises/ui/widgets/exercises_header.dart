import 'package:flutter/material.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_bar_button.dart';
import 'package:tps/generated/l10n.dart';

class ExercisesHeader extends StatelessWidget {
  const ExercisesHeader({
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
        const Spacer(),
        Text(
          S.of(context).exercises_headers,
          style: Styles.font24bold,
        ),
        const Spacer(),
        AppBarButton(icon: Icons.add, onTap: () {}),
      ],
    );
  }

  // PersistentBottomSheetController showPlayerEditSheet(BuildContext context) {
  //   return showBottomSheet(
  //       context: context,
  //       builder: (_) {
  //         return BlocProvider(
  //           create: (context) => EditPlayerCubit(),
  //           child: Builder(builder: (context) {
  //             return EditBottomSheetBody(
  //               player: player,
  //             );
  //           }),
  //         );
  //       });
  // }
}
