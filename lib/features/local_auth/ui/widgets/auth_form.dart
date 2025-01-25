import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/routing/routes.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_text_button.dart';
import 'package:tps/features/home/data/models/profile_model.dart';
import 'package:tps/features/local_auth/logic/cubit/auth_cubit.dart';

class AuthForm extends StatefulWidget {
  final double width;
  const AuthForm({
    super.key,
    required this.width,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const Text(
          "ادخل كود التحقق",
          style: TextStyle(
              fontSize: 18,
              fontWeight:
                  FontWeight.w600), // Replace Styles.semiBold18 with TextStyle
          textAlign: TextAlign.start,
        ),
        const Gap(24),
        _buildPinCodeField(context),
        const Gap(24),
        AppTextButton(
          textStyle: Styles.font16medium,
          onPressed: () {
            navigationOptions(context);
          },
          text: "التالى",
        ),
      ],
    );
  }

  Widget _buildPinCodeField(BuildContext context) {
    int pinLength = 4;
    double pinWidth = widget.width > 900
        ? widget.width / 18
        : ((widget.width / pinLength)) - (pinLength * 16);
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: pinLength,
      obscureText: true,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 70,
        fieldWidth: pinWidth,
        borderWidth: 1,
        activeColor: ColorsManager.mainBage,
        inactiveColor: ColorsManager.mainBage,
        inactiveFillColor: Colors.white,
        activeFillColor: ColorsManager.mainBage.withOpacity(0.3),
        selectedColor: Colors.grey,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onChanged: (value) => setState(() {
        otpCode = value;
      }),
      onCompleted: (code) {
        otpCode = code;
        navigationOptions(context);
      },
    );
  }

  void navigationOptions(BuildContext context) async {
    if (otpCode.isNotEmpty) {
      final ProfileModel? profile = await checkOtp(context, otpCode);
      if (profile != null) {
        context.pushReplacementNamed(Routes.homeScreen);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              duration: Duration(seconds: 1),
              backgroundColor: Colors.red,
              content: Text(
                'كود التحقق غير صحيح',
                style: TextStyle(fontSize: 18, color: Colors.white),
              )),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(seconds: 1),
            backgroundColor: Colors.red,
            content: Text(
              'ادخل كود التحقق',
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
      );
    }
  }

  Future<ProfileModel?> checkOtp(
      BuildContext context, String otpCodePins) async {
    final cubit = context.read<AuthCubit>();
    final List<ProfileModel> profiles = cubit.profiles;

    for (var profile in profiles) {
      if (profile.pin == otpCodePins) {
        return profile;
      }
    }
    return null;
  }
}
