import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_text_button.dart';

class AuthForm extends StatefulWidget {
  final double width;
  const AuthForm({super.key, required this.width});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  late String otpCode;

  // void navigationOptions(BuildContext context) async {
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
          onPressed: () {},
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
        activeColor:
            Colors.blue, // Replace with ColorsManager.blue if you have it
        inactiveColor: Colors.blue,
        inactiveFillColor: Colors.white,
        activeFillColor:
            Colors.lightBlue, // Replace with ColorsManager.lightBlue if needed
        selectedColor: Colors.blue,
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
        // navigationOptions(context);
      },
    );
  }
}
