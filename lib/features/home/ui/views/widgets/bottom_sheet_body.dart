import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/helpers/validator_utils.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_text_form_feild.dart';
import 'package:tps/features/home/logic/add_player_cubit/add_player_cubit.dart';
import 'package:tps/features/home/ui/views/widgets/add_player_bloc_listener.dart';
import 'package:tps/features/home/ui/views/widgets/phase_drop_down_button.dart';
import 'package:tps/generated/l10n.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPlayerCubit>();
    return Container(
      height: MediaQuery.sizeOf(context).height / 1.5,
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
              S.of(context).home_add_player,
              style: Styles.font16medium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Gap(16),
            AppTextFormFeild(
              hintText: S.of(context).home_add_lbl1,
              controller: cubit.nameController,
              validator: ValidatorUtils.validateName,
            ),
            const Gap(8),
            Row(
              children: [
                Expanded(
                  child: AppTextFormFeild(
                    hintText: S.of(context).home_add_lbl2,
                    controller: cubit.sportController,
                    validator: ValidatorUtils.requiredField,
                  ),
                ),
                const Gap(8),
                const Expanded(
                  child: PhaseDropDownButton(),
                )
              ],
            ),
            const Gap(8),
            Row(
              children: [
                Expanded(
                  child: AppTextFormFeild(
                    hintText: S.of(context).home_add_lbl3,
                    keyboardType: TextInputType.number,
                    controller: cubit.durationController,
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: AppTextFormFeild(
                    hintText: S.of(context).home_add_lbl4,
                    keyboardType: TextInputType.number,
                    controller: cubit.moneyController,
                  ),
                ),
              ],
            ),
            const Gap(8),
            AppTextFormFeild(
              hintText: S.of(context).home_add_lbl5,
              keyboardType: TextInputType.number,
              controller: cubit.phoneController,
              validator: ValidatorUtils.validatePhoneNumberEG,
            ),
            const Gap(8),
            AppTextFormFeild(
              hintText: S.of(context).home_add_lbl6,
              controller: cubit.descriptionController,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                cubit.addPlayer();
                // context.pop();
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
                    S.of(context).home_add_action,
                    style: Styles.font16medium
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const AddPlayerBlocListener(),
          ],
        ),
      ),
    );
  }
}
