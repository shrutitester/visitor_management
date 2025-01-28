// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:visitor_management/constants/colorConstants.dart';
// import 'package:visitor_management/controller/addProductController.dart';
// import '../../commonWidget/roundButton.dart';
// import '../../commonWidget/roundInputField.dart';
// import '../../constants/stringConstants.dart';
// import '../../utils/lotsOfThemes.dart';
// import '../createProfile/createAdminProfileScreen.dart';
// import '../main_tabview/main_tabview.dart';
//
// class LoginScreenAdmin extends StatefulWidget {
//   const LoginScreenAdmin({super.key});
//
//   @override
//   State<LoginScreenAdmin> createState() => _LoginScreenAdminState();
// }
//
// class _LoginScreenAdminState extends State<LoginScreenAdmin> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController phoneNumberController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   String phoneValue = '';
//   String password = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddProductController>(builder: (controller) {
//       return Scaffold(
//         body: SafeArea(
//             child: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             color: ColorsConstants.white,
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 25,
//                   ),
//                   Image.asset("assets/images/user.png"),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Welcome!',
//                         style: LotOfThemes.heading1,
//                         textAlign: TextAlign.start,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       RoundedInputField(
//                         controller: phoneNumberController,
//                         hintText: StringConstants.phoneNumber,
//                         maxLength: 10,
//                         counterText: "",
//                         textInputAction: TextInputAction.next,
//                         onChanged: (value) {
//                           phoneValue = value;
//                         },
//                         keyboardType: TextInputType.phone,
//                         type: StringConstants.mobile,
//                       ),
//                       RoundedInputField(
//                         controller: passwordController,
//                         hintText: StringConstants.password,
//                         maxLength: 24,
//                         maxLines: 1,
//                         counterText: "",
//                         textInputAction: TextInputAction.done,
//                         onChanged: (value) {
//                           password = value;
//                         },
//                         keyboardType: TextInputType.text,
//                         type: StringConstants.password,
//                       ),
//                       RoundButton(
//                           onPressed: () async {
//                             if (_formKey.currentState?.validate() == true) {
//                               if (phoneNumberController.toString() == '') {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content: Text(
//                                             StringConstants.alertPhoneNo)));
//                               }
//                               else if (passwordController.toString() == '') {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content:
//                                             Text(StringConstants.password)));
//                               }
//                               else {
//                                 // await controller.getAdminLogin(
//                                 //     phoneValue, password);
//                                 await controller.getAnalytics(" ");
//                                 await controller.getProfile(
//                                     '', 'pending', '', '');
//                                 if (controller.adminStatus == true) {
//                                   await controller.getProfile(
//                                       '', 'pending', '', '');
//                                   Get.offAll(const MainTabView());
//                                   Get.showSnackbar(
//                                     GetSnackBar(
//                                       title: controller.otpMsg ?? 'value',
//                                       message: controller.otpMsg ?? 'qwerty',
//                                       icon: const Icon(
//                                         Icons.refresh,
//                                         color: Colors.white,
//                                       ),
//                                       duration: const Duration(seconds: 10),
//                                     ),
//                                   );
//                                 }
//                                 else {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                           content:
//                                               Text(controller.otpMsg ?? '')));
//                                 }
//                               }
//                             }
//
//                           },
//                           title: StringConstants.login),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(StringConstants.doNtHaveAnAccount),
//                       InkWell(
//                         onTap: () {
//                           Get.to(const CreateProfileAdminScreen());
//                         },
//                         child: Text(
//                           StringConstants.signUp.toUpperCase(),
//                           style: TextStyle(color: ColorsConstants.primary),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         )),
//       );
//     });
//   }
// }
