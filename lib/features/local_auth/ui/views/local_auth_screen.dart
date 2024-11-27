import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tps/core/helpers/assets.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_text_button.dart';
import '../../../../core/helpers/local_auth_utils.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';

class LocalAuthScreen extends StatefulWidget {
  const LocalAuthScreen({super.key});

  @override
  State<LocalAuthScreen> createState() => _LocalAuthViewState();
}

class _LocalAuthViewState extends State<LocalAuthScreen> {
  late final LocalAuthUtils auth;
  bool _canCheckBiometrics = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthUtils();
    _checkBiometrics();
    _authenticate();
  }

  Future<void> _checkBiometrics() async {
    bool canCheck = await auth.canCheckBiometrics();
    setState(() {
      _canCheckBiometrics = canCheck;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = await auth.authenticate();
    navigateOptions(authenticated);
  }

  void navigateOptions(bool authenticated) {
    if (!authenticated) return;
    context.pushNamedAndRemoveUntil(Routes.homeScreen,
        predicate: (context) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Platform.isIOS
                  ? 'تسجيل دخول بال Face ID'
                  : "تسجيل دخول ببصمة الأصابع",
              style: Styles.font22bold.copyWith(color: ColorsManager.mainBage),
            ),
            const Gap(8),
            Text(
              Platform.isIOS
                  ? 'أضف Face ID لجعل حسابك أكثر أمانًا وسهولة في تسجيل الدخول.'
                  : 'أضف بصمة الأصابع لجعل حسابك أكثر أمانًا وسهولة في تسجيل الدخول.',
              style: Styles.font16regular,
            ),
            const Spacer(),
            const Gap(26),
            Center(
              child: CircleAvatar(
                radius: 120,
                backgroundColor: ColorsManager.mainBage.withOpacity(0.2),
                child: Platform.isIOS
                    ? SvgPicture.asset(
                        Assets.imagesFaceScanner,
                        colorFilter: const ColorFilter.mode(
                          ColorsManager.mainBage,
                          BlendMode.srcIn,
                        ),
                      )
                    : const Icon(
                        Icons.fingerprint,
                        size: 100,
                        color: ColorsManager.mainBage,
                      ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            AppTextButton(
              text: _canCheckBiometrics
                  ? Platform.isIOS
                      ? "فحص Face ID"
                      : "فحص البصمة"
                  : "دخول ",
              textStyle: Styles.font16medium,
              onPressed: () {
                if (!_canCheckBiometrics) {
                  navigateOptions(true);
                }
                _authenticate();
              },
            ),
          ],
        ),
      )),
    );
  }
}
