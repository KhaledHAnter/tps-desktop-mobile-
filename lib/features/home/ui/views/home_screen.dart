import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tps/core/helpers/extentions.dart';
import 'package:tps/core/helpers/firestore_services.dart';
import 'package:tps/core/theming/colors.dart';
import 'package:tps/core/theming/styles.dart';
import 'package:tps/core/widgets/app_text_button.dart';
import 'package:tps/features/home/data/models/profile_model.dart';
import 'package:tps/features/home/logic/fetch_player_cubit/fetch_players_cubit.dart';

import 'widgets/app_search_bar.dart';
import 'widgets/catigory_section.dart';
import 'widgets/player_section_bloc_builder.dart';
import 'widgets/welcome_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool showMoney = false;
FirestoreService _firestoreService = FirestoreService();
ProfileModel? _profileModel;
String pinCode = '';

void fetchProfileData(String phone) async {
  _profileModel = await _firestoreService.fetchProfileData(phone);
  log(_profileModel.toString());
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchProfileData("201551668685");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RefreshIndicator(
            onRefresh: () => context.read<FetchPlayersCubit>().fetchPlayers(),
            color: ColorsManager.mainBage,
            displacement: 100,
            child: CustomScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      WelcomeHeader(
                        onTap: () => showPinDialog(context),
                        showSheet: showMoney,
                      ),
                      const Gap(16),
                      const AppSearchBar(),
                      const Gap(24),
                      const CatigorySection(),
                      const Gap(16),
                    ],
                  ),
                ),
                PlayersSectionBlocBuilder(
                  showMoney: showMoney,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic>? showPinDialog(BuildContext context) {
    if (showMoney) {
      setState(() {
        showMoney = false;
      });
      return null;
    } else if (_profileModel == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(seconds: 1),
            backgroundColor: Colors.red,
            content: Text(
              'بيانات المستخدم غير موجودة',
              style: TextStyle(fontSize: 18, color: Colors.white),
            )),
      );
      return null;
    }
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          // Use Dialog to follow material design
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10), // Optional for rounded corners
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Ensures dialog takes up minimal height
              children: <Widget>[
                Text(
                  "أدخل كود التحقق",
                  style:
                      Styles.font16medium, // Replace Styles with your TextStyle
                  textAlign: TextAlign.start,
                ),
                const Gap(24),
                _buildPinCodeField(context),
                const Gap(24),
                AppTextButton(
                  text: "التالي",
                  textStyle: Styles.font16medium,
                  onPressed: () {
                    navigationOptions(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPinCodeField(BuildContext context) {
    int pinLength = 4;
    double pinWidth = ((MediaQuery.sizeOf(context).width / 2) / (pinLength));
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
        activeColor: ColorsManager
            .mainBage, // Replace with ColorsManager.blue if you have it
        inactiveColor: ColorsManager.mainBage,
        inactiveFillColor: Colors.white,
        activeFillColor: ColorsManager.mainBage
            .withOpacity(0.3), // Replace with ColorsManager.lightBlue if needed
        selectedColor: Colors.grey,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (code) {
        pinCode = code;
        navigationOptions(context);
      },
    );
  }

  void navigationOptions(BuildContext context) async {
    if (pinCode.isNotEmpty) {
      if (pinCode == _profileModel!.pin) {
        setState(() {
          showMoney = true;
        });
        context.pop();
      } else {
        // If not valid, show an error
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
}
