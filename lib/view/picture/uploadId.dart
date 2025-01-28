// import 'dart:io';
// import 'dart:convert';
// import 'dart:typed_data';
//
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:visitor_management/commonWidget/roundButton.dart';
// import 'package:visitor_management/controller/addProductController.dart';
//
// import '../../constants/colorConstants.dart';
// import '../../constants/stringConstants.dart';
// import '../../constants/stylesConstants.dart';
// import '../../constants/themeHelper.dart';
// import '../../model/visitingTypeModel.dart';
// import '../../utils/lotsOfThemes.dart';
// import '../yourDetails/detailsScreen.dart';
//
// class UploadIdScreen extends StatefulWidget {
//   UploadIdScreen(this.image, {super.key});
//   String image;
//
//   @override
//   State<UploadIdScreen> createState() => _UploadIdScreenState();
// }
//
// class _UploadIdScreenState extends State<UploadIdScreen> {
//   XFile? pickedImage;
//   File? image;
//   final ImagePicker _picker = ImagePicker();
//   String image64Id = '';
//   VType? vType;
//   String? type, pic;
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
//
//     });
//     image64Id = base64Image;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddProductController>(builder: (controller) {
//       return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: ColorsConstants.white,
//           title: const Text(StringConstants.uploadId, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//         ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Container(
//               color: ColorsConstants.white,
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Center(
//                 child: Column(
//                   // mainAxisAlignment: ,
//                   children: [
//                     SizedBox(
//                       height: 50,
//                       child: DropdownSearch<VType>(
//                         popupProps: PopupProps.dialog(
//                           dialogProps: DialogProps(
//                               shape: OutlineInputBorder(
//                                   // borderSide: BorderSide(color: ColorsConstants.mainBgColor),
//                                   borderRadius: BorderRadius.circular(5))),
//                           showSearchBox: true,
//                           searchFieldProps: TextFieldProps(
//                               decoration: ThemeHelper().textInputDecoration(
//                                   StringConstants.selectIdType, 'Search')),
//                         ),
//                         items: controller.vIdType,
//                         itemAsString: (VType v) => v.vTNAME ?? '',
//                         dropdownDecoratorProps: DropDownDecoratorProps(
//                           textAlignVertical: TextAlignVertical.bottom,
//                             baseStyle:
//                                 const TextStyle(overflow: TextOverflow.visible),
//                             textAlign: TextAlign.left,
//                             dropdownSearchDecoration: InputDecoration(
//                                 hintText: StringConstants.selectIdType,
//                                 hintStyle: LotOfThemes.txt14primary,
//                                 border: OutlineInputBorder(
//                                     borderSide:  BorderSide(
//                                         color: Colors.grey.shade200
//                                     ),
//                                     borderRadius: BorderRadius.circular(10)))),
//                         onChanged: (VType? value) {
//                           setState(() {
//                             vType = value;
//                             type = vType?.vTID;
//                             pic = widget.image;
//                           });
//                         },
//                       ),
//                     ),
//                     image == null
//                         ? Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 15),
//                             child: Container(
//                               height: MediaQuery.of(context).size.height / 1.6,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                       color: const Color(0xffE0E0E0)),
//                                   borderRadius: BorderRadius.circular(10)),
//                               child: const Icon(
//                                 Icons.photo_camera_outlined,
//                                 size: 100,
//                                 color: Color(0xffe2e2e2),
//                               ),
//                             ),
//                           )
//                         : Image.file(
//                             image!,
//                             height: MediaQuery.of(context).size.height / 1.5,
//                             width: MediaQuery.of(context).size.width,
//                           ),
//                     RoundButton(
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
//                           // Get.to(DetailsScreen(image64Id, pic ??'', type ?? ''));
//                         },
//                         title: StringConstants.uploadPicture)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
