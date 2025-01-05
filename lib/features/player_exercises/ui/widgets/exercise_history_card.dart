import 'package:flutter/material.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/gray_container.dart';

class ExerciseHistoryCard extends StatelessWidget {
  const ExerciseHistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GrayContainer(
      child: Row(
        children: <Widget>[
          Text(
            "09-10-2020",
            style: Styles.font16medium,
          ),
          const Spacer(
            flex: 2,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "45",
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
                    text: "8",
                    style: Styles.font20bold.copyWith(
                      color: Colors.orange,
                    )),
                TextSpan(
                    text: "عدات",
                    style: Styles.font14regular.copyWith(color: Colors.orange)),
                TextSpan(
                    text: " 3X",
                    style: Styles.font20bold.copyWith(color: Colors.orange)),
              ],
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          )
        ],
      ),
    );
  }
}
