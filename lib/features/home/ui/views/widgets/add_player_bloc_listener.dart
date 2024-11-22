import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../../../core/helpers/extentions.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/show_snackbar.dart';
import '../../../logic/add_player_cubit/add_player_cubit.dart';
import '../../../logic/add_player_cubit/add_player_state.dart';
import '../../../logic/fetch_player_cubit/fetch_players_cubit.dart';

class AddPlayerBlocListener extends StatelessWidget {
  const AddPlayerBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPlayerCubit, AddPlayerState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: LoadingAnimationWidget.bouncingBall(
                    color: ColorsManager.mainBage, size: 100),
              ),
            );
          },
          success: () {
            context.pop();
            context.pop();
            showSnackbar(context, "تم اضافة اللاعب", Colors.green);
            context.read<FetchPlayersCubit>().fetchPlayers();
          },
          error: (message) {
            context.pop();
            showSnackbar(
                context, "خطأ عند اضافة اللاعب :  $message", Colors.red);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
