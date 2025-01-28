import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/constants/stringConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';
import '../../commonWidget/roundButton.dart';
import '../../commonWidget/roundInputField.dart';
import '../../constants/colorConstants.dart';
import '../../utils/lotsOfThemes.dart';
import '../createProfile/createVisitorProfileScreen.dart';
import '../main_tabview/main_tabview.dart';
import '../visitor_tabview/visitor_tabview.dart';

class OtpVerificationScreen extends StatefulWidget {
  String phone;
  OtpVerificationScreen(this.phone, {super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  String otpValue = '';
  String mobile = '';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: ColorsConstants.white,
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 15),
            child: ListView(
              children: [
                const Text(
                  'User verification',
                  style: LotOfThemes.heading1,
                ),
                const Text(
                  "Enter the verification code we've sent",
                  style: LotOfThemes.heading2,
                ),
                Text(
                  "to +91-${widget.phone.replaceRange(0, 6, 'xxxxxx')}",
                  style: LotOfThemes.heading2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/otp verification.png"),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundedInputField(
                      controller: otpController,
                      hintText: StringConstants.enterYourOtp,
                      maxLength: 6,
                      counterText: "",
                      onChanged: (value) {
                        otpValue = value;
                      },
                      keyboardType: TextInputType.phone,
                      type: StringConstants.mobile,
                    ),
                    RoundButton(
                        onPressed: () async {
                          mobile = widget.phone;
                          await controller.getVerifyOTP(mobile, otpValue);
                          if (controller.otpStatus == true) {
                            if (controller.noOfParty == 1) {
                              if (controller.lstLogin[0].type == 'Visitor') {
                                Get.offAll(const VisitorTabview());
                                await controller.getProfile(
                                    controller.lstLogin[0].vID ?? '',
                                    '',
                                    '',
                                    '',
                                    "",
                                    "",
                                    "");
                              } else if (controller.lstLogin[0].type == 'Admin' ||
                                  controller.lstLogin[0].type == 'Employee') {
                                await controller.getConcerns(
                                    controller.lstLogin[0].vPHONE ?? '');
                                Get.offAll(const MainTabView());
                              }
                            } else if (controller.lstLogin.isEmpty) {
                              Get.offAll(CreateProfileScreen(mobile));
                            }
                          } else if (controller.otpStatus == false) {
                            Get.offAll(OtpVerificationScreen(widget.phone));
                          }
                        },
                        title: StringConstants.verifyOtp),
                  ],
                )
              ],
            ),
          ),
        )),
      );
    });
  }
}
