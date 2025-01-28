import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/commonWidget/roundInputField.dart';
import 'package:visitor_management/constants/stringConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/utils/lotsOfThemes.dart';
import 'package:visitor_management/view/login/otpVerification.dart';
import '../../commonWidget/roundButton.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stylesConstants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  String phoneValue = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsConstants.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Image.asset("assets/images/user.png"),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome!',
                          style: LotOfThemes.heading1,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RoundedInputField(
                          controller: phoneNumberController,
                          hintText: StringConstants.phoneNumber,
                          maxLength: 10,
                          counterText: "",
                          onChanged: (value) {
                            phoneValue = value;
                          },
                          keyboardType: TextInputType.phone,
                          type: StringConstants.mobile,
                        ),
                      ],
                    ),
                    RoundButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            if (phoneNumberController.toString() == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text(StringConstants.alertPhoneNo)));
                            } else {
                              await controller.getLogin(phoneValue);
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              '${controller.otp}',
                                              style: AppStyles.boldText(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: ColorsConstants
                                                      .blackColor),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            RoundButton(
                                                onPressed: () {
                                                  // Get.to(HistoryScreen());
                                                  Get.offAll(
                                                      OtpVerificationScreen(
                                                          phoneValue));
                                                },
                                                title: 'Next')
                                          ],
                                        ),
                                      ));
                            }
                          }
                        },
                        title: StringConstants.sendOtp),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
