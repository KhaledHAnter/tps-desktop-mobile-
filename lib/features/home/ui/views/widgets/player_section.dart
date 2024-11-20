import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';

class PlayersSection extends StatelessWidget {
  final void Function()? onTap;
  const PlayersSection({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
      itemCount: 12,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              color: ColorsManager.containergray,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  "خالد حمدي حلمي",
                  style:
                      Styles.font16medium.copyWith(fontWeight: FontWeight.w600),
                ),
                const Gap(4),
                Text(
                  "كرة يد",
                  style: Styles.font16medium,
                ),
                const Gap(4),
                Text(
                  "مرحلة الإختبار",
                  style: Styles.font14medium,
                ),
                const Spacer(
                  flex: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text("2000ج.م", style: Styles.font14medium),
                      const Spacer(),
                      Text("20يوم",
                          style: Styles.font14medium
                              .copyWith(color: Colors.redAccent)),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
