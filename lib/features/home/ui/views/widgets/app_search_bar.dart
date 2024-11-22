import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/features/home/logic/fetch_player_cubit/fetch_players_cubit.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key});

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  String searchQuery = "";
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FetchPlayersCubit>();
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.containergray,
        hintText: S.of(context).home_search,
        hintStyle: Styles.font12regular,
        prefixIcon: const Icon(Icons.search, color: ColorsManager.fontsgray),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (query) {
        setState(() {
          searchQuery = query;
        });
        cubit.searchPlayersByName(query); // Trigger search
      },
    );
  }
}
