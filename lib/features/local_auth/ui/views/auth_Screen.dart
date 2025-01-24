import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/helpers/assets.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/widgets/circle_logo.dart';
import 'package:tps/core/widgets/loading_indicator.dart';
import 'package:tps/features/local_auth/logic/cubit/auth_cubit.dart';
import 'package:tps/features/local_auth/ui/widgets/auth_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) =>
              current is AuthSuccess || current is AuthError,
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Center(
                child: LoadingIndicator(),
              ),
              authsuccess: (profile) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    log(constraints.maxWidth.toString());
                    if (constraints.maxWidth > 900) {
                      return Row(
                        children: <Widget>[
                          AuthCodeSide(
                            width: constraints.maxWidth,
                          ),
                          const AuthImage(),
                        ],
                      );
                    } else {
                      return AuthCodeSide(
                        width: constraints.maxWidth,
                      );
                    }
                  },
                );
              },
              autherror: (message) {
                return Center(
                  child: Text(message),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class AuthCodeSide extends StatelessWidget {
  final double width;
  const AuthCodeSide({
    super.key,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
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
