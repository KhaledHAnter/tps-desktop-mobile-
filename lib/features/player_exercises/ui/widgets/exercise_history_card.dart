import 'package:flutter/material.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/gray_container.dart';
import 'package:tps/features/player_exercises/data/models/exercise_model.dart';

class ExerciseHistoryCard extends StatelessWidget {
  final HistoryModel history;
  const ExerciseHistoryCard({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    String formatDateTime(DateTime dateTime) {
      final day = dateTime.day.toString().padLeft(2, '0');
      final month = dateTime.month.toString().padLeft(2, '0');
      final year = dateTime.year.toString();
      return '$day-$month-$year';
    }

    return GrayContainer(
      child: Row(
        children: <Widget>[
          Text(
            formatDateTime(history.date),
            style: Styles.font16medium,
          ),
          const Spacer(
            flex: 2,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${history.weight}",
                  style: Styles.font20bold.copyWith(color: Colors.green),
                ),
                TextSpan(
                    text: "كجم",
                    style: Styles.font14regular.copyWith(color: Colors.green)),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "${history.reps}",
                    style: Styles.font20bold.copyWith(
                      color: Colors.orange,
                    )),
                TextSpan(
                    text: "عدات",
                    style: Styles.font14regular.copyWith(color: Colors.orange)),
                TextSpan(
                    text: " ${history.sets}X",
                    style: Styles.font20bold.copyWith(color: Colors.orange)),
              ],
            ),
          ),
          // const Spacer(),
          // const Icon(
          //   Icons.arrow_forward_ios,
          //   size: 16,
          // )
        ],
      ),
    );
  }
}
