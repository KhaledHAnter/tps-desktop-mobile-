import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/features/player_details/logic/add_days_cubit/add_days_cubit.dart';
import 'package:tps/features/player_details/ui/widgets/add_days_bloc_listener.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_feild.dart';
import '../../../../../generated/l10n.dart';

class AddDaysBottomSheet extends StatefulWidget {
  final PlayerModel player;
  const AddDaysBottomSheet({
    super.key,
    required this.player,
  });

  @override
  State<AddDaysBottomSheet> createState() => _AddDaysBottomSheetState();
}

class _AddDaysBottomSheetState extends State<AddDaysBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddDaysCubit>();

    return Container(
      height: MediaQuery.sizeOf(context).height / 3,
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
              S.of(context).add_days,
              style: Styles.font16medium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
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
            const Spacer(),
            GestureDetector(
              onTap: () {
                cubit.addDays(widget.player.phone, widget.player);
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
                    S.of(context).add_days,
                    style: Styles.font16medium
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const Spacer(),
            AddDaysBlocListener(
              documentId: widget.player.phone,
            ),
          ],
        ),
      ),
    );
  }
}
