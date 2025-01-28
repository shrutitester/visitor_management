// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:visitor_management/constants/colorConstants.dart';
// import 'package:visitor_management/constants/stringConstants.dart';
// import 'package:get/get.dart';
// import 'package:visitor_management/constants/stylesConstants.dart';
// import 'package:visitor_management/view/picture/uploadId.dart';
// import '../../commonWidget/roundButton.dart';
//
// class TakePictureScreen extends StatefulWidget {
//   const TakePictureScreen({super.key});
//
//   @override
//   State<TakePictureScreen> createState() => _TakePictureScreenState();
// }
//
// class _TakePictureScreenState extends State<TakePictureScreen> {
//   XFile? pickedImage;
//   File? image;
//   final ImagePicker _picker = ImagePicker();
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
//     image64 = base64Image;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ColorsConstants.white,
//         centerTitle: true,
//         title: const Text(
//           StringConstants.takePicture,
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             color: ColorsConstants.white,
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: Center(
//               child: InkWell(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     image == null
//                         ? Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                             child: Container(
//                               height: MediaQuery.of(context).size.height / 1.5,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: const Color(0xffE0E0E0)),
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: const Icon(
//                                 Icons.photo_camera_outlined,
//                                 size: 100,
//                                 color: Color(0xffE2E2E2),
//                               ),
//                             ),
//                           )
//                         : Image.file(
//                             image!,
//                             height: MediaQuery.of(context).size.height / 1.5,
//                             width: MediaQuery.of(context).size.width,
//                           ),
//                     RoundButton(
//                       height: 42,
//                       onPressed: () {
//                         showDialog(
//                             context: context,
//                             builder: (context) => AlertDialog(
//                                   content: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       Text(
//                                         'Select Option',
//                                         style: AppStyles.boldText(
//                                             fontSize: 20,
//                                             fontWeight: FontWeight.w700,
//                                             color: ColorsConstants.blackColor),
//                                       ),
//                                       const SizedBox(
//                                         height: 15,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           openPicker(ImageSource.camera);
//                                         },
//                                         child: Text(
//                                           'Take Photo',
//                                           style: AppStyles.boldText(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w400,
//                                               color:
//                                                   ColorsConstants.blackColor),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 5,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           openPicker(ImageSource.gallery);
//                                         },
//                                         child: Text(
//                                           'Choose From Gallery',
//                                           style: AppStyles.boldText(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.w400,
//                                               color:
//                                                   ColorsConstants.blackColor),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ));
//                       },
//                       title: StringConstants.takePicture,
//                       type: RoundButtonType.textPrimary,
//                     ),
//                     RoundButton(
//                         onPressed: () {
//                           Get.to(UploadIdScreen(image64));
//                         },
//                         title: StringConstants.uploadPicture),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
