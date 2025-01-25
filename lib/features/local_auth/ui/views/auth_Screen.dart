import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tps/core/widgets/loading_indicator.dart';
import 'package:tps/features/local_auth/logic/cubit/auth_cubit.dart';
import 'package:tps/features/local_auth/ui/widgets/auth_code_side.dart';
import 'package:tps/features/local_auth/ui/widgets/auth_image.dart';
import 'package:tps/features/local_auth/ui/widgets/small_web.dart';

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
                      return SmallWebSreen(
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
