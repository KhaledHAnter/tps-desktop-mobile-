import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_text_form_feild.dart';
import 'package:tps/features/home/data/models/category_model.dart';
import 'package:tps/generated/l10n.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 1.7,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
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
          const Gap(16),
          AppTextFormFeild(
            hintText: S.of(context).home_add_lbl1,
          ),
          const Gap(8),
          Row(
            children: [
              Expanded(
                child: AppTextFormFeild(
                  hintText: S.of(context).home_add_lbl2,
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
                ),
              ),
              const Gap(8),
              Expanded(
                child: AppTextFormFeild(
                  hintText: S.of(context).home_add_lbl4,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const Gap(8),
          AppTextFormFeild(
            hintText: S.of(context).home_add_lbl5,
            keyboardType: TextInputType.number,
          ),
          const Gap(8),
          AppTextFormFeild(
            hintText: S.of(context).home_add_lbl6,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              context.pop();
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
                  style:
                      Styles.font16medium.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
