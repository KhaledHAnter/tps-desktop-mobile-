import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/data/models/category_model.dart';
import 'package:tps/features/home/data/models/sort_criteria_enum.dart';
import 'package:tps/features/home/logic/category_cubit/category_cubit.dart';
import 'package:tps/features/home/logic/fetch_player_cubit/fetch_players_cubit.dart';
import 'package:tps/features/home/ui/views/widgets/catigory_tile.dart';
import 'package:tps/generated/l10n.dart';

class CatigorySection extends StatefulWidget {
  const CatigorySection({
    super.key,
  });

  @override
  State<CatigorySection> createState() => _CatigorySectionState();
}

class _CatigorySectionState extends State<CatigorySection> {
  SortCriteria selectedCriteria = SortCriteria.newest;
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
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                S.of(context).home_title,
                style: Styles.font16medium,
              ),
            ),
            const Spacer(),
            Expanded(
              child: DropdownButton<SortCriteria>(
                isExpanded: true,
                underline: const SizedBox.shrink(),
                value: selectedCriteria,
                items: [
                  DropdownMenuItem(
                      value: SortCriteria.newest,
                      child: Text(S.of(context).home_sort_cri1)),
                  DropdownMenuItem(
                      value: SortCriteria.money,
                      child: Text(S.of(context).home_sort_cri2)),
                  DropdownMenuItem(
                      value: SortCriteria.remainingDuration,
                      child: Text(S.of(context).home_sort_cri3)),
                  DropdownMenuItem(
                      value: SortCriteria.name,
                      child: Text(S.of(context).home_sort_cri4)),
                  DropdownMenuItem(
                      value: SortCriteria.sport,
                      child: Text(S.of(context).home_sort_cri5)),
                ],
                onChanged: (criteria) {
                  if (criteria != null) {
                    setState(() {
                      selectedCriteria = criteria;
                    });
                    context
                        .read<FetchPlayersCubit>()
                        .fetchAndSortPlayers(criteria);
                  }
                },
              ),
            ),
          ],
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
