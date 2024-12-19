import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/generated/l10n.dart';

class ExercisesItemContainer extends StatefulWidget {
  // final List<FreezeModel> freezes;
  // final String playerId;
  const ExercisesItemContainer({
    super.key,
  });

  @override
  State<ExercisesItemContainer> createState() => _FreezeListState();
}

class _FreezeListState extends State<ExercisesItemContainer> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: ColorsManager.containergray,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            // FreezePlayerBlocListener(documentId: widget.playerId),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 55,
                  child: Text(" - Lat-Pulldown", style: Styles.font16medium),
                ),
                Expanded(
                  flex: 35,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.fitness_center,
                        color: Colors.redAccent,
                      ),
                      const Gap(2),
                      Text("65KG ", style: Styles.font16medium),
                      const Gap(4),
                      Text(" 3X12", style: Styles.font16medium),
                    ],
                  ),
                ),
                // const Spacer(),
                Expanded(
                  flex: 10,
                  child: Icon(
                    _isExpanded
                        ? Icons.arrow_drop_up_sharp
                        : Icons.arrow_drop_down_sharp,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("--  21-9-2024    65KG    3X12",
                            style: Styles.font16medium),
                        const Spacer(),
                        const Icon(Icons.delete, color: Colors.red)
                      ],
                    ),
                    const Gap(4),
                    Row(
                      children: [
                        Text("--  18-9-2024    60KG    3X12",
                            style: Styles.font16medium),
                        const Spacer(),
                        const Icon(Icons.delete, color: Colors.red)
                      ],
                    ),
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.equalizer),
                            Text(
                              "الإحصائيات",
                              style: Styles.font14medium,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.add),
                            Text(
                              "إضافة وزن",
                              style: Styles.font14medium,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.edit),
                            Text(
                              "تعديل",
                              style: Styles.font14medium,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            Text(
                              "حذف",
                              style: Styles.font14medium,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                  // widget.freezes.isEmpty
                  //     ? [
                  //         const Gap(24),
                  //         Text(S.of(context).details_no_freeze),
                  //         const Gap(24),
                  //       ]
                  //     : widget.freezes
                  //         .map((freeze) => FreezeTile(
                  //               freeze: freeze,
                  //               onPressed: () async {
                  //                 final confirmed =
                  //                     await showFreezeDeleteConfirmationDialog(
                  //                         context);
                  //                 if (!confirmed) return;
                  //                 if (context.mounted) {}
                  //                 context
                  //                     .read<FreezePlayerCubit>()
                  //                     .deletePlayerFreeze(widget.playerId,
                  //                         widget.freezes.indexOf(freeze), freeze);
                  //               },
                  //             ))
                  //         .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
