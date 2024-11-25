import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tps/features/player_details/logic/fetch_single_player_cubit/fetch_single_player_cubit.dart';
import 'package:tps/features/player_details/logic/freeze_player_cubit/freeze_player_cubit.dart';
import '../../../../../core/helpers/extentions.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/show_snackbar.dart';

class FreezePlayerBlocListener extends StatelessWidget {
  final String documentId;
  const FreezePlayerBlocListener({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FreezePlayerCubit, FreezePlayerState>(
      listenWhen: (previous, current) =>
          current is FreezeLoading ||
          current is FreezeSuccess ||
          current is UnFreezeSuccess ||
          current is FreezeError,
      listener: (context, state) {
        state.whenOrNull(
          freezeLoading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: LoadingAnimationWidget.bouncingBall(
                    color: ColorsManager.mainBage, size: 100),
              ),
            );
          },
          unFreezeSuccess: () {
            context.pop();
            showSnackbar(context, "تم تجميد اشتراك اللاعب", Colors.green);
            context
                .read<FetchSinglePlayerCubit>()
                .fetchPlayerDetails(documentId);
          },
          freezeSuccess: () {
            context.pop();
            context.pop();
            showSnackbar(context, "تم تجميد اشتراك اللاعب", Colors.green);
            context
                .read<FetchSinglePlayerCubit>()
                .fetchPlayerDetails(documentId);
          },
          freezeError: (message) {
            context.pop();
            showSnackbar(
                context, "خطأ عند تجميد اللاعب :  $message", Colors.red);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
