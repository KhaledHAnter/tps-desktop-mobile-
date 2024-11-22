import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  const AppBarButton({super.key, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0XFFEDEDED),
          ),
        ),
        child: Icon(icon),
      ),
    );
  }
}
