import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/ui/views/widgets/app_search_bar.dart';
import 'package:tps/features/home/ui/views/widgets/welcome_header.dart';
import 'package:tps/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const WelcomeHeader(),
            const Gap(16),
            const AppSearchBar(),
            const Gap(24),
            CatigorySection(
              cards: [
                S.of(context).home_cat1,
                S.of(context).home_cat2,
                S.of(context).home_cat3,
                S.of(context).home_cat4,
                S.of(context).home_cat5,
                S.of(context).home_cat6
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class CatigorySection extends StatefulWidget {
  final List<String> cards;
  const CatigorySection({super.key, required this.cards});

  @override
  State<CatigorySection> createState() => _CatigorySectionState();
}

class _CatigorySectionState extends State<CatigorySection> {
  int _selectedIndex = 0;
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
            itemCount: widget.cards.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: CategoryTile(
                title: widget.cards[index],
                isSelected: index == _selectedIndex,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      // width: MediaQuery.sizeOf(context).width / 2 - 32,
      decoration: BoxDecoration(
          color: isSelected
              ? ColorsManager.mainBage.withOpacity(0.2)
              : ColorsManager.containergray,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          title,
          style: Styles.font14medium,
        ),
      ),
    );
  }
}
