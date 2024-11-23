import 'package:flutter/material.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/data/models/category_model.dart';
import 'package:tps/features/home/data/models/player_model.dart';
import 'package:tps/generated/l10n.dart';

class PlayerPhase extends StatelessWidget {
  final PlayerModel player;
  const PlayerPhase({super.key, required this.player});
  String getCategoryText(String phase, List<CategoryModel> categories) {
    final category = categories.firstWhere(
      (category) => category.name == phase,
      orElse: () => CategoryModel(name: "unknown", text: "Unknown Phase"),
    );
    return category.text;
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        name: "enteristed",
        text: S.of(context).home_cat2,
      ),
      CategoryModel(
        name: "under_exam1",
        text: S.of(context).home_cat3,
      ),
      CategoryModel(
        name: "waiting_for_program1",
        text: S.of(context).home_cat4,
      ),
      CategoryModel(
        name: "first_3_weeks",
        text: S.of(context).home_cat5,
      ),
      CategoryModel(
        name: "under_exam2",
        text: S.of(context).home_cat6,
      ),
      CategoryModel(
        name: "wa iting_for_program2",
        text: S.of(context).home_cat7,
      ),
      CategoryModel(
        name: "have_6_weeks",
        text: S.of(context).home_cat8,
      ),
      CategoryModel(
        name: "last_exam",
        text: S.of(context).home_cat9,
      ),
      CategoryModel(
        name: "get_last_weeks",
        text: S.of(context).home_cat10,
      ),
      CategoryModel(
        name: "sub_ended",
        text: S.of(context).home_cat11,
      ),
    ];
    return Align(
      alignment: Alignment.center,
      child: Text(
        getCategoryText(player.phase, categories),
        style: Styles.font20bold,
      ),
    );
  }
}
