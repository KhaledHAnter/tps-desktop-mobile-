import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/data/models/freeze_model.dart';
import 'package:tps/generated/l10n.dart';

class FreezeList extends StatefulWidget {
  final List<FreezeModel> freezes;
  const FreezeList({super.key, required this.freezes});

  @override
  State<FreezeList> createState() => _FreezeListState();
}

class _FreezeListState extends State<FreezeList> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
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
            Row(
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
            if (_isExpanded)
              Column(
                children: widget.freezes.isEmpty
                    ? [
                        const Gap(24),
                        Text(S.of(context).details_no_freeze),
                        const Gap(24),
                      ]
                    : widget.freezes
                        .map((freeze) => FreezeTile(freeze: freeze))
                        .toList(),
              )
          ],
        ),
      ),
    );
  }
}

class FreezeTile extends StatelessWidget {
  final FreezeModel freeze;
  const FreezeTile({super.key, required this.freeze});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text("* ${freeze.freezeDays} ايام - ${freeze.freezeReason}",
            style: Styles.font14medium, textAlign: TextAlign.start),
      ),
    );
  }
}
