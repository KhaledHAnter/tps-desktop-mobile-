import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/helpers/validator_utils.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/player_details/logic/freeze_player_cubit/freeze_player_cubit.dart';
import 'package:tps/features/player_details/ui/widgets/freeze_player_bloc_listener.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_feild.dart';
import '../../../../../generated/l10n.dart';

class FreezePlayerBottomSheet extends StatefulWidget {
  final PlayerModel player;
  const FreezePlayerBottomSheet({
    super.key,
    required this.player,
  });

  @override
  State<FreezePlayerBottomSheet> createState() =>
      _FreezePlayerBottomSheetState();
}

class _FreezePlayerBottomSheetState extends State<FreezePlayerBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FreezePlayerCubit>();

    return Container(
      height: MediaQuery.sizeOf(context).height / 2.5,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: <Widget>[
            Container(
              height: 5,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                color: Colors.black.withOpacity(.6),
              ),
            ),
            const Gap(32),
            Text(
              S.of(context).freeze_freeze,
              style: Styles.font16medium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            AppTextFormFeild(
              hintText: S.of(context).freeze_days,
              keyboardType: TextInputType.number,
              controller: cubit.freezeDaysController,
              validator: ValidatorUtils.requiredField,
            ),
            const Gap(8),
            AppTextFormFeild(
              hintText: S.of(context).freeze_reason,
              controller: cubit.freezeReasonController,
              validator: ValidatorUtils.requiredField,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                cubit.freezePlayerSubscription(widget.player.phone);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: ColorsManager.mainBage,
                ),
                child: Center(
                  child: Text(
                    S.of(context).freeze_freeze,
                    style: Styles.font16medium
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const Spacer(),
            // FreezePlayerBlocListener(
            //   documentId: widget.player.phone,
            // ),
          ],
        ),
      ),
    );
  }
}
