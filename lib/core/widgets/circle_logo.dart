import 'package:flutter/material.dart';
import 'package:tps/core/helpers/assets.dart';

class CircleLogo extends StatelessWidget {
  const CircleLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(Assets.imagesMainLogo),
          fit: BoxFit.cover,
        ),
      ),
      height: 120,
      width: 120,
    );
  }
}
