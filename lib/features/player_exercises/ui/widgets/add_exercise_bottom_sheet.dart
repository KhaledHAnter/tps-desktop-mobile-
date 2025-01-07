import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/helpers/validator_utils.dart';
import 'package:tps/features/player_details/ui/widgets/add_days_bloc_listener.dart';
import 'package:tps/features/player_exercises/logic/cubit/add_exercise_cubit.dart';
import 'package:tps/features/player_exercises/ui/widgets/add_exercise_bloc_listener.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/app_text_form_feild.dart';

class AddExerciseBottomSheet extends StatefulWidget {
  final String phone;
  const AddExerciseBottomSheet({super.key, required this.phone});

  @override
  State<AddExerciseBottomSheet> createState() => _AddExerciseBottomSheetState();
}

class _AddExerciseBottomSheetState extends State<AddExerciseBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddExerciseCubit>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: cubit.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 5,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(32)),
                color: Colors.black.withOpacity(.6),
              ),
            ),
            const Gap(16),
            Text(
              "إضافة تمرين جديد",
              style: Styles.font16medium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(16),
            AppTextFormFeild(
              hintText: "اسم التمرين",
              controller: cubit.nameController,
              validator: ValidatorUtils.requiredField,
            ),
            const Gap(8),
            Row(
              children: [
                Expanded(
                  child: AppTextFormFeild(
                    hintText: "عدد المجاميع",
                    controller: cubit.setsController,
                    keyboardType: TextInputType.number,
                    validator: ValidatorUtils.requiredField,
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: AppTextFormFeild(
                    hintText: "عدد العدات",
                    controller: cubit.repsController,
                    keyboardType: TextInputType.number,
                    validator: ValidatorUtils.requiredField,
                  ),
                ),
              ],
            ),
            const Gap(16),
            GestureDetector(
              onTap: () {
                cubit.addExercise(widget.phone);
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
                    "اضافة",
                    style: Styles.font16medium
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const AddExerciseBlocListener(),
          ],
        ),
      ),
    );
  }
}
