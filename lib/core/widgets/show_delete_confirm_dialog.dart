import 'package:flutter/material.dart';
import 'package:tps/generated/l10n.dart';

Future<bool> showDeleteConfirmationDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(S.of(context).actions_delete_confirm),
            content: Text(S.of(context).actions_delete_desc),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false); // Return false if canceled
                },
                child: Text(S.of(context).actions_cancel),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true); // Return true if confirmed
                },
                style: ElevatedButton.styleFrom(
                    // backgroundColor:
                    //     Colors.red.shade100, // Optional: Highlight delete button
                    ),
                child: Text(S.of(context).actions_confirm),
              ),
            ],
          );
        },
      ) ??
      false; // Return false if dialog is dismissed
}
