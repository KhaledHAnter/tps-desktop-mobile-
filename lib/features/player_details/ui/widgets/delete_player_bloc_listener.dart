import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tps/core/routing/routes.dart';
import 'package:tps/features/player_details/logic/delete_player_cubit/delete_player_cubit.dart';
import '../../../../../core/helpers/extentions.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/show_snackbar.dart';

class DeletePlayerBlocListener extends StatelessWidget {
  const DeletePlayerBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeletePlayerCubit, DeletePlayerState>(
      listenWhen: (previous, current) =>
          current is DeleteLoading ||
          current is DeleteSuccess ||
          current is DeleteError,
      listener: (context, state) {
        state.whenOrNull(
          deleteLoading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: LoadingAnimationWidget.bouncingBall(
                    color: ColorsManager.mainBage, size: 100),
              ),
            );
          },
          deleteSuccess: () {
            context.pop();
            showSnackbar(context, "تم حذف اللاعب", Colors.green);
            context.pushNamedAndRemoveUntil(Routes.homeScreen,
                predicate: (_) => false);
          },
          deleteError: (message) {
            context.pop();
            showSnackbar(
                context, "خطأ عند حذف بيانات اللاعب :  $message", Colors.red);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
