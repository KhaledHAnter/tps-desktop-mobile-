import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tps/features/player_details/logic/edit_player_cubit/edit_player_cubit.dart';
import 'package:tps/features/player_details/logic/fetch_single_player_cubit/fetch_single_player_cubit.dart';
import '../../../../../core/helpers/extentions.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/show_snackbar.dart';

class EditPlayerBlocListener extends StatelessWidget {
  final String documentId;
  const EditPlayerBlocListener({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditPlayerCubit, EditPlayerState>(
      listenWhen: (previous, current) =>
          current is EditLoading ||
          current is EditSuccess ||
          current is EditError,
      listener: (context, state) {
        state.whenOrNull(
          editLoading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: LoadingAnimationWidget.bouncingBall(
                    color: ColorsManager.mainBage, size: 100),
              ),
            );
          },
          editSuccess: () {
            context.pop();
            context.pop();
            showSnackbar(context, "تم تعديل اللاعب", Colors.green);
            context
                .read<FetchSinglePlayerCubit>()
                .fetchPlayerDetails(documentId);
          },
          editError: (message) {
            context.pop();
            showSnackbar(
                context, "خطأ عند تعديل اللاعب :  $message", Colors.red);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
