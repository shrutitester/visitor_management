// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:visitor_management/constants/colorConstants.dart';
// import 'package:visitor_management/controller/addProductController.dart';
//
// import '../../constants/stringConstants.dart';
//
// class ProfilePage extends StatefulWidget {
//   String id;
//   String image;
//   String name;
//   String email;
//   String phone;
//   String address;
//   String visitorType;
//   String purpose;
//   ProfilePage(this.id, this.image, this.name, this.email, this.phone,
//       this.address, this.visitorType, this.purpose,
//       {super.key});
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddProductController>(builder: (controller) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: ColorsConstants.white,
//           title: const Text(StringConstants.profile),
//           centerTitle: true,
//         ),
//         body: SafeArea(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             color: ColorsConstants.white,
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: NetworkImage('http://${widget.image}'),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: const Color(0xffEFEFF9),
//                       borderRadius: BorderRadius.circular(8)),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 15, vertical: 10),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             const SizedBox(
//                               width: 130,
//                               child: Text(
//                                 '${StringConstants.name} :',
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                             ),
//                             Expanded(
//                                 child: Text(
//                               widget.name,
//                               style: const TextStyle(fontSize: 14),
//                             ))
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             const SizedBox(
//                               width: 130,
//                               child: Text(
//                                 '${StringConstants.email} :',
//                                 style: TextStyle(fontSize: 15),
//                               ),
//                             ),
//                             Expanded(
//                                 child: Text(
//                               widget.email,
//                               style: const TextStyle(fontSize: 14),
//                             ))
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             const SizedBox(
//                                 width: 130,
//                                 child: Text(
//                                   '${StringConstants.phoneNumber} :',
//                                   style: TextStyle(fontSize: 15),
//                                 )),
//                             Expanded(
//                                 child: Text(
//                               widget.phone,
//                               style: const TextStyle(fontSize: 14),
//                             ))
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             const SizedBox(
//                                 width: 130,
//                                 child: Text(
//                                   '${StringConstants.address} :',
//                                   style: TextStyle(fontSize: 15),
//                                 )),
//                             Expanded(
//                                 child: Text(
//                               widget.address,
//                               style: const TextStyle(fontSize: 14),
//                             ))
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             const SizedBox(
//                                 width: 130,
//                                 child: Text(
//                                   '${StringConstants.visitorType} :',
//                                   style: TextStyle(fontSize: 15),
//                                 )),
//                             Expanded(
//                                 child: Text(
//                               widget.visitorType,
//                               style: const TextStyle(fontSize: 14),
//                             ))
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             const SizedBox(
//                                 width: 130,
//                                 child: Text(
//                                   '${StringConstants.purpose} :',
//                                   style: TextStyle(fontSize: 15),
//                                 )),
//                             Expanded(
//                                 child: Text(
//                               widget.purpose,
//                               style: const TextStyle(fontSize: 14),
//                             ))
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context ).size.width / 2.2,
//                       height: 45,
//                       decoration: BoxDecoration(
//                           color: const Color(0xff055D2A),
//                           // shape: BoxShape.rectangle,
//                           border: Border.all(color: const Color(0xff055D2A)),
//                           borderRadius: BorderRadius.circular(8)),
//
//                       child: ElevatedButton(
//                         onPressed: () async {
//                           setState(() {
//                             controller.getUpdateVisitor(
//                                 widget.id , 'Approved','');
//                             controller.getProfile(
//                                 controller.id ?? '', 'pending');
//                           });
//                           Get.back();
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xff055D2A),
//                             textStyle: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 15,
//                                 fontStyle: FontStyle.normal)),
//                         child: const Text(
//                           'Approve',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Container(
//                       width: MediaQuery.of(context ).size.width / 2.2,
//                       height: 45,
//                       decoration: BoxDecoration(
//                           color: const Color(0xffD32B0A),
//                           // shape: BoxShape.rectangle,
//                           border: Border.all(color: const Color(0xffD32B0A)),
//                           borderRadius: BorderRadius.circular(8)),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             controller.getUpdateVisitor(
//                                 widget.id , 'Rejected','');
//                             controller.getProfile(
//                                 controller.id ?? '', 'pending');
//                             controller.getProfile(
//                                 controller.id ?? '', 'pending');
//                           });
//                           Get.back();
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xffD32B0A),
//                             textStyle: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 17,
//                                 fontStyle: FontStyle.normal)),
//                         child: const Text(
//                           'Reject',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
