import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/di/dependency_injection.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_bar_button.dart';
import 'package:tps/features/player_exercises/logic/cubit/exercises_cubit.dart';
import 'package:tps/features/player_exercises/ui/widgets/add_exercise_bottom_sheet.dart';
import 'package:tps/generated/l10n.dart';

class ExercisesHeader extends StatelessWidget {
  final String phone;
  const ExercisesHeader({
    super.key,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppBarButton(
          icon: Icons.arrow_back_ios_new,
          onTap: () => context.pop(),
        ),
        const Spacer(),
        Text(
          S.of(context).exercises_headers,
          style: Styles.font24bold,
        ),
        const Spacer(),
        AppBarButton(
            icon: Icons.add, onTap: () => _showBottomSheet(context, phone)),
      ],
    );
  }

  void _showBottomSheet(BuildContext context, String phone) {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return AddExerciseBottomSheet(
          phone: phone,
        );
      },
    );
  }
}
