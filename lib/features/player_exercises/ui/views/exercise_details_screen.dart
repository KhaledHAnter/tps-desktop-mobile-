import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_text_button.dart';
import 'package:tps/core/widgets/gray_container.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';
import 'package:tps/features/player_exercises/ui/widgets/exercise_details_header.dart';
import 'package:tps/features/player_exercises/ui/widgets/exercise_history_card.dart';
import 'package:tps/features/player_exercises/ui/widgets/record_new_reps.dart';
import 'package:tps/features/player_exercises/ui/widgets/record_new_sets.dart';
import 'package:tps/features/player_exercises/ui/widgets/record_new_weight.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final ExerciseModel exercise;
  const ExerciseDetailsScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width / 2 - 48;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              ListView(
                children: [
                  ExersiceDetailsHeader(
                    exerciseName: exercise.name,
                  ),
                  const Gap(12),
                  GrayContainer(
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.analytics_outlined,
                          color: ColorsManager.mainBage,
                        ),
                        const Gap(8),
                        Text(
                          "إحصائيات التمرينة",
                          style: Styles.font16medium,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: ColorsManager.mainBage,
                        ),
                      ],
                    ),
                  ),
                  const Gap(24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "السجل الخاص بالتمرينة",
                      style: Styles.font20bold.copyWith(fontSize: 18),
                    ),
                  ),
                  const Gap(12),
                  ...List.generate(
                      3,
                      (index) => const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: ExerciseHistoryCard(),
                          )),
                ],
              ),
              addHistory(width, context)
            ],
          ),
        ),
      ),
    );
  }

  Positioned addHistory(double width, BuildContext context) {
    return Positioned(
      bottom: 16,
      left: width,
      right: width,
      child: IconButton(
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.all(16)),
          backgroundColor: WidgetStatePropertyAll(ColorsManager.mainBage),
        ),
        onPressed: () {
          _showBottomSheet(context);
        },
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const GrayContainer(
                child: Column(
                  children: <Widget>[
                    RecordNewWeight(
                      weight: 45,
                    ),
                    Gap(12),
                    RecordNewSets(sets: 3),
                    Gap(12),
                    RecordNewReps(reps: 10),
                  ],
                ),
              ),
              const Gap(12),
              AppTextButton(
                text: "حفظ",
                textStyle: Styles.font16medium,
                onPressed: () {
                  context.pop();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
