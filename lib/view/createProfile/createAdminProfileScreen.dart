// import 'dart:io';
// import 'dart:convert';
// import 'dart:typed_data';
//
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../commonWidget/roundButton.dart';
// import '../../commonWidget/roundInputField.dart';
// import '../../constants/colorConstants.dart';
// import '../../constants/stringConstants.dart';
// import '../../constants/stylesConstants.dart';
// import '../../constants/themeHelper.dart';
// import '../../controller/addProductController.dart';
// import '../../model/getVisitorModel.dart';
// import '../../model/visitingTypeModel.dart';
// import '../../utils/lotsOfThemes.dart';
// import '../login/loginScreenAdmin.dart';
//
// class CreateProfileAdminScreen extends StatefulWidget {
//   const CreateProfileAdminScreen({super.key});
//
//   @override
//   State<CreateProfileAdminScreen> createState() =>
//       _CreateProfileAdminScreenState();
// }
//
// class _CreateProfileAdminScreenState extends State<CreateProfileAdminScreen> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController companyNameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   String? type,
//       gender,
//       giD,
//       name,
//       email,
//       phone,
//       address,
//       company,
//       password,
//       confirmPassword;
//   LstParty? lstParty;
//   VType? vType;
//   XFile? pickedImage;
//   File? image;
//   File? images;
//   final ImagePicker _picker = ImagePicker();
//   String image64Id = '';
//   String image64 = '';
//
//   void openPicker(ImageSource source) async {
//     Navigator.pop(context);
//     pickedImage = await _picker.pickImage(
//         source: source, imageQuality: 100, maxHeight: 600, maxWidth: 600);
//     File file = File(pickedImage!.path);
//     Uint8List imageBytes = await file.readAsBytes(); //convert to bytes
//     String base64Image = base64.encode(imageBytes);
//     setState(() {
//       image = file;
//     });
//     image64Id = base64Image;
//   }
//
//   void openPickers(ImageSource source) async {
//     Navigator.pop(context);
//     pickedImage = await _picker.pickImage(
//         source: source, imageQuality: 100, maxHeight: 600, maxWidth: 600);
//     File file = File(pickedImage!.path);
//     Uint8List imageBytes = await file.readAsBytes(); //convert to bytes
//     String base64Image = base64.encode(imageBytes);
//     setState(() {
//       images = file;
//     });
//     image64 = base64Image;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddProductController>(builder: (controller) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Create Profile',
//             style: LotOfThemes.heading1,
//           ),
//           backgroundColor: ColorsConstants.white,
//         ),
//         backgroundColor: ColorsConstants.white,
//         body: SafeArea(
//           child: ListView(
//             scrollDirection: Axis.vertical,
//             // physics: const ClampingScrollPhysics(),
//             shrinkWrap: true,
//             children: [
//               Form(
//                 key: _formKey,
//                 child: ListView(
//                   scrollDirection: Axis.vertical,
//                   primary: true,
//                   shrinkWrap: true,
//                   physics: const ClampingScrollPhysics(),
//                   children: [
//                     Padding(
//                       padding:
//                       const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Full Name',
//                             style: LotOfThemes.heading3,
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           RoundedInputField(
//                             controller: nameController,
//                             hintText: "Enter your name",
//                             textInputAction: TextInputAction.next,
//                             keyboardType: TextInputType.name,
//                             type: StringConstants.username,
//                             maxLength: 24,
//                             counterText: '',
//                             onChanged: (value) {
//                               name = value;
//                             },
//                           ),
//                           const Text(
//                             'Gender',
//                             style: LotOfThemes.heading3,
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           SizedBox(
//                             height: 42,
//                             child: DropdownSearch<String>(
//                               popupProps: PopupProps.dialog(
//                                 fit: FlexFit.loose,
//                                 dialogProps: DialogProps(
//                                     shape: OutlineInputBorder(
//                                         // borderSide: BorderSide(color: ColorsConstants.mainBgColor),
//                                         borderRadius: BorderRadius.circular(5))),
//                                 showSearchBox: true,
//                                 searchFieldProps: TextFieldProps(
//                                     decoration: ThemeHelper().textInputDecoration(
//                                         StringConstants.selectIdType, 'Search')),
//                               ),
//                               items: const ['Female', 'Male'],
//                               dropdownDecoratorProps: DropDownDecoratorProps(
//                                   textAlignVertical: TextAlignVertical.bottom,
//                                   baseStyle: const TextStyle(
//                                       overflow: TextOverflow.visible),
//                                   textAlign: TextAlign.left,
//                                   dropdownSearchDecoration: InputDecoration(
//                                       hintText: StringConstants.selectIdType,
//                                       hintStyle: LotOfThemes.txt14primary,
//                                       border: OutlineInputBorder(
//                                           borderSide: const BorderSide(
//                                               color: Color(0xFF989898)),
//                                           borderRadius:
//                                               BorderRadius.circular(10)))),
//                               onChanged: (value) {
//                                 gender = value;
//                               },
//                               validator: (String? value) {
//                                 if (value == null) {
//                                   return "Required field";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               // onChanged: (VType? value) {
//                               //   // setState(() {
//                               //   //   vType = value;
//                               //   //   type = vType?.vTID;
//                               //   //   pic = widget.image;
//                               //   // });
//                               // },
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const Text(
//                             'Mobile Number',
//                             style: LotOfThemes.heading3,
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           RoundedInputField(
//                             controller: phoneController,
//                             hintText: "Enter your mobile number",
//                             textInputAction: TextInputAction.next,
//                             keyboardType: TextInputType.phone,
//                             maxLength: 10,
//                             counterText: '',
//                             type: StringConstants.mobile,
//                             onChanged: (value) {
//                               phone = value;
//                             },
//                           ),
//                           const Text(
//                             'E-mail Address',
//                             style: LotOfThemes.heading3,
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           RoundedInputField(
//                             controller: emailController,
//                             hintText: 'Enter your e-mail address',
//                             textInputAction: TextInputAction.next,
//                             keyboardType: TextInputType.emailAddress,
//                             type: StringConstants.username,
//                             onChanged: (value) {
//                               email = value;
//                             },
//                           ),
//                           const Text(
//                             'Company Name',
//                             style: LotOfThemes.heading3,
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           RoundedInputField(
//                             controller: companyNameController,
//                             hintText: "Enter your company name",
//                             textInputAction: TextInputAction.next,
//                             keyboardType: TextInputType.text,
//                             type: StringConstants.username,
//                             onChanged: (value) {
//                               company = value;
//                             },
//                           ),
//                           const Text(
//                             'Department',
//                             style: LotOfThemes.heading3,
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           SizedBox(
//                             height: 42,
//                             child: DropdownSearch<VType>(
//                               popupProps: PopupProps.dialog(
//                                 fit: FlexFit.loose,
//                                 dialogProps: DialogProps(
//                                     shape: OutlineInputBorder(
//                                         // borderSide: BorderSide(color: ColorsConstants.mainBgColor),
//                                         borderRadius: BorderRadius.circular(5))),
//                                 showSearchBox: true,
//                                 searchFieldProps: TextFieldProps(
//                                     decoration: ThemeHelper().textInputDecoration(
//                                         StringConstants.selectIdType, 'Search')),
//                               ),
//                               items: controller.department,
//                               itemAsString: (VType v) => v.vTNAME ?? '',
//                               dropdownDecoratorProps: DropDownDecoratorProps(
//                                   textAlignVertical: TextAlignVertical.bottom,
//                                   baseStyle: const TextStyle(
//                                       overflow: TextOverflow.visible),
//                                   textAlign: TextAlign.left,
//                                   dropdownSearchDecoration: InputDecoration(
//                                       hintText: StringConstants.selectIdType,
//                                       hintStyle: LotOfThemes.txt14primary,
//                                       border: OutlineInputBorder(
//                                           borderSide: const BorderSide(
//                                               color: Color(0xFF989898)),
//                                           borderRadius:
//                                               BorderRadius.circular(10)))),
//                               onChanged: (VType? value) {
//                                 setState(() {
//                                   vType = value;
//                                   type = vType?.vTID;
//                                   // pic = widget.image;
//                                 });
//                               },
//                               validator: (VType? value) {
//                                 if (value == null) {
//                                   return "Required field";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 8,
//                           ),
//                           const Text(
//                             'Chose Your Government ID',
//                             style: LotOfThemes.heading3,
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           SizedBox(
//                             height: 42,
//                             child: DropdownSearch<VType>(
//                               popupProps: PopupProps.dialog(
//                                 fit: FlexFit.loose,
//                                 dialogProps: DialogProps(
//                                     shape: OutlineInputBorder(
//                                         // borderSide: BorderSide(color: ColorsConstants.mainBgColor),
//                                         borderRadius: BorderRadius.circular(5))),
//                                 showSearchBox: true,
//                                 searchFieldProps: TextFieldProps(
//                                     decoration: ThemeHelper().textInputDecoration(
//                                         StringConstants.selectIdType, 'Search')),
//                               ),
//                               items: controller.vIdType,
//                               itemAsString: (VType v) => v.vTNAME ?? '',
//                               dropdownDecoratorProps: DropDownDecoratorProps(
//                                   textAlignVertical: TextAlignVertical.bottom,
//                                   baseStyle: const TextStyle(
//                                       overflow: TextOverflow.visible),
//                                   textAlign: TextAlign.left,
//                                   dropdownSearchDecoration: InputDecoration(
//                                       hintText: StringConstants.selectIdType,
//                                       hintStyle: LotOfThemes.txt14primary,
//                                       border: OutlineInputBorder(
//                                           borderSide: const BorderSide(
//                                               color: Color(0xFF989898)),
//                                           borderRadius:
//                                               BorderRadius.circular(10)))),
//                               onChanged: (VType? value) {
//                                 setState(() {
//                                   vType = value;
//                                   giD = vType?.vTID;
//                                   // pic = widget.image;
//                                 });
//                               },
//                               validator: (VType? value) {
//                                 if (value == null) {
//                                   return "Required field";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           image != null
//                               ? InkWell(
//                                   onTap: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) => AlertDialog(
//                                               content: Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: [
//                                                   Text(
//                                                     'Select Option',
//                                                     style: AppStyles.boldText(
//                                                         fontSize: 20,
//                                                         fontWeight:
//                                                             FontWeight.w700,
//                                                         color: ColorsConstants
//                                                             .blackColor),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 15,
//                                                   ),
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       openPicker(
//                                                           ImageSource.camera);
//                                                     },
//                                                     child: Text(
//                                                       'Take Photo',
//                                                       style: AppStyles.boldText(
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           color: ColorsConstants
//                                                               .blackColor),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 5,
//                                                   ),
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       openPicker(
//                                                           ImageSource.gallery);
//                                                     },
//                                                     child: Text(
//                                                       'Choose From Gallery',
//                                                       style: AppStyles.boldText(
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           color: ColorsConstants
//                                                               .blackColor),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ));
//                                   },
//                                   child: SizedBox(
//                                     height:
//                                         MediaQuery.of(context).size.height / 5,
//                                     width: MediaQuery.of(context).size.width / 3,
//                                     child: Image.file(image!),
//                                   ),
//                                 )
//                               : InkWell(
//                                   onTap: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) => AlertDialog(
//                                               content: Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: [
//                                                   Text(
//                                                     'Select Option',
//                                                     style: AppStyles.boldText(
//                                                         fontSize: 20,
//                                                         fontWeight:
//                                                             FontWeight.w700,
//                                                         color: ColorsConstants
//                                                             .blackColor),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 15,
//                                                   ),
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       openPicker(
//                                                           ImageSource.camera);
//                                                     },
//                                                     child: Text(
//                                                       'Take Photo',
//                                                       style: AppStyles.boldText(
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           color: ColorsConstants
//                                                               .blackColor),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 5,
//                                                   ),
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       openPicker(
//                                                           ImageSource.gallery);
//                                                     },
//                                                     child: Text(
//                                                       'Choose From Gallery',
//                                                       style: AppStyles.boldText(
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           color: ColorsConstants
//                                                               .blackColor),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ));
//                                   },
//                                   child: Container(
//                                     height: 100,
//                                     width: MediaQuery.of(context).size.width,
//                                     decoration: BoxDecoration(
//                                         color: const Color(0xffE4E4E4),
//                                         borderRadius: BorderRadius.circular(8),
//                                         border: Border.all(
//                                           color: const Color(0xffE4E4E4),
//                                         )),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Image.asset(
//                                             'assets/images/Upload document.png'),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         const Text('Upload Document')
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const Text(
//                             'Take Your Photo',
//                             style: LotOfThemes.heading3,
//                           ),
//                           images != null
//                               ? InkWell(
//                                   onTap: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) => AlertDialog(
//                                               content: Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: [
//                                                   Text(
//                                                     'Select Option',
//                                                     style: AppStyles.boldText(
//                                                         fontSize: 20,
//                                                         fontWeight:
//                                                             FontWeight.w700,
//                                                         color: ColorsConstants
//                                                             .blackColor),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 15,
//                                                   ),
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       openPickers(
//                                                           ImageSource.camera);
//                                                     },
//                                                     child: Text(
//                                                       'Take Photo',
//                                                       style: AppStyles.boldText(
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           color: ColorsConstants
//                                                               .blackColor),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 5,
//                                                   ),
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       openPickers(
//                                                           ImageSource.gallery);
//                                                     },
//                                                     child: Text(
//                                                       'Choose From Gallery',
//                                                       style: AppStyles.boldText(
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           color: ColorsConstants
//                                                               .blackColor),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ));
//                                   },
//                                   child: SizedBox(
//                                     height:
//                                         MediaQuery.of(context).size.height / 5,
//                                     width: MediaQuery.of(context).size.width / 3,
//                                     child: Image.file(images!),
//                                   ),
//                                 )
//                               : InkWell(
//                                   onTap: () {
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) => AlertDialog(
//                                               content: Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 children: [
//                                                   Text(
//                                                     'Select Option',
//                                                     style: AppStyles.boldText(
//                                                         fontSize: 20,
//                                                         fontWeight:
//                                                             FontWeight.w700,
//                                                         color: ColorsConstants
//                                                             .blackColor),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 15,
//                                                   ),
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       openPickers(
//                                                           ImageSource.camera);
//                                                     },
//                                                     child: Text(
//                                                       'Take Photo',
//                                                       style: AppStyles.boldText(
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           color: ColorsConstants
//                                                               .blackColor),
//                                                     ),
//                                                   ),
//                                                   const SizedBox(
//                                                     height: 5,
//                                                   ),
//                                                   GestureDetector(
//                                                     onTap: () {
//                                                       openPickers(
//                                                           ImageSource.gallery);
//                                                     },
//                                                     child: Text(
//                                                       'Choose From Gallery',
//                                                       style: AppStyles.boldText(
//                                                           fontSize: 16,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           color: ColorsConstants
//                                                               .blackColor),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ));
//                                   },
//                                   child: Container(
//                                     height: 100,
//                                     width: MediaQuery.of(context).size.width,
//                                     decoration: BoxDecoration(
//                                         color: const Color(0xffE4E4E4),
//                                         borderRadius: BorderRadius.circular(8),
//                                         border: Border.all(
//                                           color: const Color(0xffE4E4E4),
//                                         )),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Image.asset(
//                                             'assets/images/take photo.png'),
//                                         const SizedBox(
//                                           height: 10,
//                                         ),
//                                         const Text('Take Photo'),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const Text(
//                             'Enter Password',
//                             style: LotOfThemes.heading3,
//                           ),
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           RoundedInputField(
//                             controller: passwordController,
//                             hintText: "Enter Password",
//                             textInputAction: TextInputAction.next,
//                             keyboardType: TextInputType.text,
//                             type: StringConstants.username,
//                             onChanged: (value) {
//                               password = value;
//                             },
//                           ),
//                           // const Text(
//                           //   'Confirm Password',
//                           //   style: LotOfThemes.heading3,
//                           // ),
//                           // const SizedBox(
//                           //   height: 5,
//                           // ),
//                           // SizedBox(
//                           //   height: 55,
//                           //   child: RoundedInputField(
//                           //     controller: confirmPasswordController,
//                           //     hintText: "Enter your company name",
//                           //     textInputAction: TextInputAction.done,
//                           //     keyboardType: TextInputType.text,
//                           //     type: StringConstants.username,
//                           //     onChanged: (value) {
//                           //       confirmPassword = value;
//                           //       if(value != passwordController.text){
//                           //         return 'Confirm password not matching';
//                           //       }
//                           //       return null;
//                           //
//                           //     },
//                           //   ),
//                           // ),
//                           RoundButton(
//                             onPressed: () async {
//                               if (_formKey.currentState?.validate() == true) {
//                                 if (nameController.toString() == '') {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                           content:
//                                               Text(StringConstants.username)));
//                                 } else if (phoneController.toString() == "") {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                           content: Text(
//                                               StringConstants.alertPhoneNo)));
//                                 } else if (emailController.toString() == '') {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                           content: Text(StringConstants.email)));
//                                 } else if (companyNameController.toString() ==
//                                     '') {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                           content:
//                                               Text(StringConstants.companyName)));
//                                 } else if (passwordController.toString() == '') {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(
//                                           content:
//                                               Text(StringConstants.password)));
//                                 } else {
//                                   Get.to(const LoginScreenAdmin());
//                                   await controller.getAdminProfile(
//                                       phone ?? '',
//                                       name ?? '',
//                                       password ?? '',
//                                       email ?? '',
//                                       company ?? '',
//                                       image64Id,
//                                       giD ?? '',
//                                       image64,
//                                       type ?? '');
//                                   Get.showSnackbar(
//                                     GetSnackBar(
//                                       title: controller.adminMsg ?? 'value',
//                                       message: controller.adminMsg ?? 'qwerty',
//                                       icon: const Icon(
//                                         Icons.refresh,
//                                         color: Colors.white,
//                                       ),
//                                       duration: const Duration(seconds: 10),
//                                     ),
//                                   );
//                                 }
//                               }
//                             },
//                             title: StringConstants.save,
//                           ),
//                           // const SizedBox(
//                           //   height: 100,
//                           // )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
