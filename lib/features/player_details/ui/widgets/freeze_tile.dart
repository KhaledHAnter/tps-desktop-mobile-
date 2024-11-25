import 'package:flutter/material.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/features/home/data/models/freeze_model.dart';

class FreezeTile extends StatelessWidget {
  final FreezeModel freeze;
  final void Function()? onPressed;
  const FreezeTile({super.key, required this.freeze, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          Text("* ${freeze.freezeDays} ايام - ${freeze.freezeReason}",
              style: Styles.font14medium, textAlign: TextAlign.start),
          const Spacer(),
          GestureDetector(
            onTap: onPressed,
            child: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
