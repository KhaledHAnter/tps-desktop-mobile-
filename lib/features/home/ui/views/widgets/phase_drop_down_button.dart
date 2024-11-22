import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/features/home/data/models/category_model.dart';
import 'package:tps/features/home/logic/add_player_cubit/add_player_cubit.dart';
import 'package:tps/generated/l10n.dart';

class PhaseDropDownButton extends StatefulWidget {
  const PhaseDropDownButton({super.key});

  @override
  State<PhaseDropDownButton> createState() => _PhaseDropDownButtonState();
}

class _PhaseDropDownButtonState extends State<PhaseDropDownButton> {
  String? selectedCategory;
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
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.containergray,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(),
      ),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(8),
        dropdownColor: ColorsManager.containergray,
        alignment: Alignment.center,
        focusColor: ColorsManager.containergray,
        isExpanded: true,
        underline: Container(),
        value: selectedCategory, // The currently selected category
        hint: const Text('اختار المرحلة'), // Placeholder text
        items: categories.map((category) {
          return DropdownMenuItem<String>(
            value: category.name, // Use the category name as the value
            child: Text(category.text), // Display the category text
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedCategory = value; // Update the selected category
          });
          context.read<AddPlayerCubit>().phaseController =
              selectedCategory ?? '';
        },
      ),
    );
  }
}
