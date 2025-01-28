// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:visitor_management/controller/addProductController.dart';
// import 'package:visitor_management/view/myRequest/reject/rejectedListItem.dart';
//
// import '../../../constants/colorConstants.dart';
//
// class RejectedScreen extends StatefulWidget {
//   const RejectedScreen({super.key});
//
//   @override
//   State<RejectedScreen> createState() => _RejectedScreenState();
// }
//
// class _RejectedScreenState extends State<RejectedScreen> {
//   final AddProductController _controller = Get.find();
//
//   @override
//   void initState() {
//     approved();
//     super.initState();
//   }
//
//   void approved() async {
//     await _controller.getProfile(_controller.id ??'', 'rejected','','');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddProductController>(builder: (controller){
//       return Container(
//         color: ColorsConstants.white,
//         height: MediaQuery.of(context).size.height,
//         padding: const EdgeInsets.all(10),
//         child: ListView.builder(
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             physics: const ClampingScrollPhysics(),
//             itemCount: controller.lstParty.length,
//             itemBuilder:(context, int index){
//               return RejectedListItem(controller.lstParty[index]);
//             }),
//       );
//     });
//   }
// }
