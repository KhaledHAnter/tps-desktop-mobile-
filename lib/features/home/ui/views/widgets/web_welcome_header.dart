import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/widgets/app_bar_button.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/helpers/assets.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../logic/add_player_cubit/add_player_cubit.dart';
import 'bottom_sheet_body.dart';

class WebHomeHeader extends StatelessWidget {
  final void Function()? onTap;
  final bool showSheet;
  const WebHomeHeader({
    super.key,
    this.onTap,
    required this.showSheet,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: 30,
            child: Image.asset(
              Assets.imagesAvatar,
            ),
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

  void showErrSnack(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
          content: Text(
            'يجب ادخال كود الموظف اولاً',
            style: TextStyle(fontSize: 18, color: Colors.white),
          )),
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
