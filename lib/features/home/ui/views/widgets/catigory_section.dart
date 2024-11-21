import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/data/models/category_model.dart';
import 'package:tps/features/home/logic/cubit/category_cubit.dart';
import 'package:tps/features/home/ui/views/widgets/catigory_tile.dart';
import 'package:tps/generated/l10n.dart';

class CatigorySection extends StatelessWidget {
  const CatigorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        name: "All",
        text: S.of(context).home_cat1,
      ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          S.of(context).home_title,
          style: Styles.font16medium,
        ),
        const Gap(16),
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 13,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                // setState(() {
                //   _selectedIndex = index;
                // });
                context.read<CategoryCubit>().changeIndex(index);
              },
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  return CategoryTile(
                    title: categories[index].text,
                    isSelected:
                        index == context.read<CategoryCubit>().currentIndex,
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
