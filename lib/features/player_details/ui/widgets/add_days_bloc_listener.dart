import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tps/features/player_details/logic/add_days_cubit/add_days_cubit.dart';
import 'package:tps/features/player_details/logic/edit_player_cubit/edit_player_cubit.dart';
import 'package:tps/features/player_details/logic/fetch_single_player_cubit/fetch_single_player_cubit.dart';
import '../../../../../core/helpers/extentions.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/show_snackbar.dart';

class AddDaysBlocListener extends StatelessWidget {
  final String documentId;
  const AddDaysBlocListener({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddDaysCubit, AddDaysState>(
      listenWhen: (previous, current) =>
          current is AddDaysLoading ||
          current is AddDaysSuccess ||
          current is AddDaysError,
      listener: (context, state) {
        state.whenOrNull(
          addDaysLoading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: LoadingAnimationWidget.bouncingBall(
                    color: ColorsManager.mainBage, size: 100),
              ),
            );
          },
          addDaysSuccess: () {
            context.pop();
            context.pop();
            showSnackbar(context, "تم تمديد اشتراك اللاعب", Colors.green);
            context
                .read<FetchSinglePlayerCubit>()
                .fetchPlayerDetails(documentId);
          },
          addDaysError: (message) {
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
