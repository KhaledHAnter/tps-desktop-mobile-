import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/show_freeze_delete_confirm_dialog.dart';
import 'package:tps/features/home/data/models/freeze_model.dart';
import 'package:tps/features/player_details/logic/freeze_player_cubit/freeze_player_cubit.dart';
import 'package:tps/features/player_details/ui/widgets/freeze_player_bloc_listener.dart';
import 'package:tps/features/player_details/ui/widgets/freeze_tile.dart';
import 'package:tps/generated/l10n.dart';

class FreezeList extends StatefulWidget {
  final List<FreezeModel> freezes;
  final String playerId;
  const FreezeList({super.key, required this.freezes, required this.playerId});

  @override
  State<FreezeList> createState() => _FreezeListState();
}

class _FreezeListState extends State<FreezeList> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: ColorsManager.containergray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          FreezePlayerBlocListener(documentId: widget.playerId),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.ac_unit,
                  color:
                      widget.freezes.isEmpty ? Colors.grey : Colors.blueAccent,
                ),
                const Gap(8),
                Text(S.of(context).details_freeze, style: Styles.font16medium),
                const Spacer(),
                Icon(
                  _isExpanded
                      ? Icons.arrow_drop_up_sharp
                      : Icons.arrow_drop_down_sharp,
                  color:
                      widget.freezes.isEmpty ? Colors.grey : Colors.blueAccent,
                ),
              ],
            ),
          ),
          if (_isExpanded)
            Column(
              children: widget.freezes.isEmpty
                  ? [
                      const Gap(24),
                      Text(S.of(context).details_no_freeze),
                      const Gap(24),
                    ]
                  : widget.freezes
                      .map((freeze) => FreezeTile(
                            freeze: freeze,
                            onPressed: () async {
                              final confirmed =
                                  await showFreezeDeleteConfirmationDialog(
                                      context);
                              if (!confirmed) return;
                              if (context.mounted) {}
                              context
                                  .read<FreezePlayerCubit>()
                                  .deletePlayerFreeze(widget.playerId,
                                      widget.freezes.indexOf(freeze), freeze);
                            },
                          ))
                      .toList(),
            )
        ],
      ),
    );
  }
}
