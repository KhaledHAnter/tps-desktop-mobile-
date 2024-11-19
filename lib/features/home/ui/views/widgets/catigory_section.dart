import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/logic/cubit/category_cubit.dart';
import 'package:tps/features/home/ui/views/widgets/catigory_tile.dart';
import 'package:tps/generated/l10n.dart';

class CatigorySection extends StatelessWidget {
  final List<String> cards;
  const CatigorySection({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
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
            itemCount: cards.length,
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
                    title: cards[index],
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
