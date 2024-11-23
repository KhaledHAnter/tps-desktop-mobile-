import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/widgets/app_bar_button.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/helpers/assets.dart';
import '../../../../../core/theming/styles.dart';
import '../../../logic/add_player_cubit/add_player_cubit.dart';
import 'bottom_sheet_body.dart';
import '../../../../../generated/l10n.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          child: Image.asset(
            Assets.imagesAvatar,
          ),
        ),
        const Gap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).home_hi,
              style: Styles.font14medium.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              S.of(context).home_subHi,
              style: Styles.font12regular.copyWith(
                color: const Color(0XFFB0B0B0),
              ),
            ),
          ],
        ),
        const Spacer(),
        AppBarButton(
          onTap: () => showPlayerAddSheet(context),
          icon: Icons.add,
        ),
      ],
    );
  }

  PersistentBottomSheetController showPlayerAddSheet(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (_) {
          return BlocProvider(
            create: (context) => getIt<AddPlayerCubit>(),
            child: const BottomSheetBody(),
          );
        });
  }
}
