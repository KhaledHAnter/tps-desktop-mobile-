import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tps/core/routing/routes.dart';
import 'package:tps/features/player_details/logic/fetch_single_player_cubit/fetch_single_player_cubit.dart';
import '../../../../../core/helpers/extentions.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/show_snackbar.dart';

class FetchSinglePlayerBlocListener extends StatelessWidget {
  const FetchSinglePlayerBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchSinglePlayerCubit, FetchSinglePlayerState>(
      listenWhen: (previous, current) =>
          current is FetchLoading ||
          current is FetchSuccess ||
          current is FetchError,
      listener: (context, state) {
        state.whenOrNull(
          fetchLoading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: LoadingAnimationWidget.bouncingBall(
                    color: ColorsManager.mainBage, size: 100),
              ),
            );
          },
          fetchSuccess: (player) {
            context.pop();
            showSnackbar(context, "تم تحميل بيانات اللاعب", Colors.green);
            context.pushReplacementNamed(Routes.palyerDetailsScreen,
                arguments: player);
          },
          fetchError: (message) {
            context.pop();
            showSnackbar(
                context, "خطأ عند تحميل بيانات اللاعب :  $message", Colors.red);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
