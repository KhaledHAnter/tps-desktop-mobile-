import 'package:flutter/material.dart';
import 'package:tps/core/helpers/assets.dart';
import 'package:tps/core/theming/colors.dart';

class AuthImage extends StatelessWidget {
  const AuthImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        // padding: const EdgeInsets.all(128),
        color: ColorsManager.mainBage,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesCover), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
