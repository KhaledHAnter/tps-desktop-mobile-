import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/widgets/circle_logo.dart';
import 'package:tps/features/local_auth/ui/widgets/auth_form.dart';

class SmallWebSreen extends StatelessWidget {
  final double width;
  const SmallWebSreen({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const CircleLogo(),
          const Gap(48),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 100),
            child: AuthForm(
              width: width,
            ),
          ),
        ],
      ),
    );
  }
}
