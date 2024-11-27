import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/helpers/directory_utils.dart';
import 'package:tps/core/widgets/app_bar_button.dart';
import 'package:tps/features/home/logic/fetch_player_cubit/fetch_players_cubit.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/helpers/assets.dart';
import '../../../../../core/theming/styles.dart';
import '../../../logic/add_player_cubit/add_player_cubit.dart';
import 'bottom_sheet_body.dart';
import '../../../../../generated/l10n.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FetchPlayersCubit>();
    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          child: Image.asset(
            Assets.imagesAvatar,
          ),
        ),
        const Gap(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).home_hi,
              style: Styles.font14medium.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              S.of(context).home_subHi,
              style: Styles.font12regular.copyWith(
                color: const Color(0XFFB0B0B0),
              ),
            ),
          ],
        ),
        const Spacer(),
        AppBarButton(
          onTap: () async {
            DirectoryUtils directoryUtils = DirectoryUtils();
            final path = await directoryUtils.getGlobalDirectoryPath(
                fileName: 'players.xlsx');
            directoryUtils.openFile(
              File(path),
              fileType:
                  'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            );
          },
          icon: Icons.file_open_outlined,
        ),
        const Gap(8),
        AppBarButton(
          onTap: () => cubit.generateExcelFile(cubit.allPlayers),
          icon: Icons.document_scanner_outlined,
        ),
        const Gap(8),
        AppBarButton(
          onTap: () => showPlayerAddSheet(context),
          icon: Icons.add,
        ),
      ],
    );
  }

  PersistentBottomSheetController showPlayerAddSheet(BuildContext context) {
    return showBottomSheet(
        context: context,
        builder: (_) {
          return BlocProvider(
            create: (context) => getIt<AddPlayerCubit>(),
            child: const BottomSheetBody(),
          );
        });
  }
}
