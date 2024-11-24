import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/widgets/date_picker_widget.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/player_details/logic/edit_player_cubit/edit_player_cubit.dart';
import 'package:tps/features/player_details/ui/widgets/edit_phase_drop_down_button.dart';
import 'package:tps/features/player_details/ui/widgets/edit_player_bloc_listener.dart';
import '../../../../../core/helpers/validator_utils.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_feild.dart';
import '../../../../../generated/l10n.dart';

class EditBottomSheetBody extends StatefulWidget {
  final PlayerModel player;
  const EditBottomSheetBody({
    super.key,
    required this.player,
  });

  @override
  State<EditBottomSheetBody> createState() => _EditBottomSheetBodyState();
}

class _EditBottomSheetBodyState extends State<EditBottomSheetBody> {
  @override
  void initState() {
    final cubit = context.read<EditPlayerCubit>();
    cubit.nameController.text = widget.player.name;
    cubit.moneyController.text = widget.player.money.toString();
    cubit.sportController.text = widget.player.sport;
    cubit.descriptionController.text = widget.player.description ?? "";
    cubit.durationController.text = widget.player.subsDuration.toString();
    context.read<EditPlayerCubit>().startDate = widget.player.startDate;
    super.initState();
  }

  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditPlayerCubit>();

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
              S.of(context).edit_player,
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
              // initialValue: player.name,
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
                Expanded(
                  child: EditPhaseDropDownButton(
                    initialPhase: widget.player.phase,
                  ),
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
            DatePickerWidget(
              label: 'Pick a Date',
              initialDate: widget.player.startDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                  cubit.startDate = selectedDate ?? widget.player.startDate;
                });
              },
            ),
            const Gap(8),
            AppTextFormFeild(
              hintText: S.of(context).home_add_lbl6,
              controller: cubit.descriptionController,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                cubit.updatePlayerDetails(widget.player.phone);
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
                    S.of(context).edit_button_lbl,
                    style: Styles.font16medium
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const Spacer(),
            EditPlayerBlocListener(
              documentId: widget.player.phone,
            ),
          ],
        ),
      ),
    );
  }
}
