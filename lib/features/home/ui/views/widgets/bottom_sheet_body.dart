import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/helpers/validator_utils.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_feild.dart';
import '../../../logic/add_player_cubit/add_player_cubit.dart';
import 'add_player_bloc_listener.dart';
import 'phase_drop_down_button.dart';
import '../../../../../generated/l10n.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddPlayerCubit>();

    Future<void> pasteText() async {
      try {
        final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
        cubit.phaseController = clipboardData?.text ?? "Clipboard is empty";
      } catch (e) {
        cubit.phaseController = "00";
      }
    }

    return Container(
      height: MediaQuery.sizeOf(context).height / 1.6,
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
            Row(
              children: [
                Expanded(
                  child: AppTextFormFeild(
                    hintText: S.of(context).home_add_lbl1,
                    controller: cubit.nameController,
                    validator: ValidatorUtils.validateName,
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: AppTextFormFeild(
                    hintText: S.of(context).home_add_lbl7,
                    controller: cubit.ageController,
                    validator: ValidatorUtils.requiredField,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
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
                    digitsOnly: true,
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: AppTextFormFeild(
                    hintText: S.of(context).home_add_lbl4,
                    keyboardType: TextInputType.number,
                    controller: cubit.moneyController,
                    digitsOnly: true,
                  ),
                ),
              ],
            ),
            const Gap(8),
            Row(
              children: [
                Expanded(
                  child: AppTextFormFeild(
                    hintText: S.of(context).home_add_lbl5,
                    keyboardType: TextInputType.number,
                    controller: cubit.phoneController,
                    validator: ValidatorUtils.validateNumberOnly,
                    digitsOnly: true,
                  ),
                ),
                const Gap(8),
                IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: ColorsManager.mainBage.withOpacity(0.2),
                    ),
                    onPressed: () {
                      cubit.pasteText();
                    },
                    icon: const Icon(
                      Icons.paste_rounded,
                      color: ColorsManager.mainBage,
                    ))
              ],
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
