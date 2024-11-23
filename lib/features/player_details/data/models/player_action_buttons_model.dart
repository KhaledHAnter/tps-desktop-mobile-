import 'package:flutter/material.dart';

class PlayerActionButtonsModel {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  PlayerActionButtonsModel({
    required this.title,
    required this.icon,
    this.onTap,
  });
}
