// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:visitor_management/constants/colorConstants.dart';
// import 'package:visitor_management/controller/addProductController.dart';
//
// import '../../utils/dateFormat.dart';
//
// class ScheduledVisit extends StatefulWidget {
//   const ScheduledVisit({super.key});
//
//   @override
//   State<ScheduledVisit> createState() => _ScheduledVisitState();
// }
//
// class _ScheduledVisitState extends State<ScheduledVisit> {
//  final AddProductController _controller =Get.find();
//
//  @override
//   void initState() {
//     super.initState();
//     schedule();
//   }
//
//   void schedule() async {
//    await _controller.getProfile('', '','','');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddProductController>(builder: (controller) {
//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Scheduled visits this week',
//                 style: TextStyle(
//                     fontSize: 16,
//                     fontFamily: 'DMSans',
//                     fontWeight: FontWeight.w600),
//               ),
//               Text('View all')
//             ],
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.width * 0.04,
//           ),
//           // ListView.builder(
//           //     shrinkWrap: true,
//           //     physics: const ClampingScrollPhysics(),
//           //     itemCount: 2,
//           //     itemBuilder: (context, index) {
//           //       return Container(
//           //         margin: const EdgeInsets.only(bottom: 10),
//           //         width: MediaQuery.of(context).size.width,
//           //         decoration: BoxDecoration(
//           //             border: Border.all(color: ColorsConstants.grey),
//           //             borderRadius: BorderRadius.circular(4)),
//           //         child: Padding(
//           //           padding:
//           //               const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           //           child: Column(
//           //             children: [
//           //               const Row(
//           //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //                 children: [
//           //                   Text(
//           //                     'Rahul Kumar (Meeting)',
//           //                     style: TextStyle(
//           //                         fontSize: 13,
//           //                         fontFamily: 'DMSans',
//           //                         fontWeight: FontWeight.w600),
//           //                   ),
//           //                   Text(
//           //                     '11/06/2024',
//           //                     style: TextStyle(
//           //                         fontSize: 13,
//           //                         fontFamily: 'DMSans',
//           //                         fontWeight: FontWeight.w600),
//           //                   ),
//           //                 ],
//           //               ),
//           //               Row(
//           //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //                 children: [
//           //                   Text(
//           //                     'with Ravi Kushwaha',
//           //                     style: TextStyle(
//           //                         color: ColorsConstants.grey,
//           //                         fontSize: 12,
//           //                         fontFamily: 'DMSans',
//           //                         fontWeight: FontWeight.normal),
//           //                   ),
//           //                   Text(
//           //                     '09:00 AM',
//           //                     style: TextStyle(
//           //                         color: ColorsConstants.grey,
//           //                         fontSize: 12,
//           //                         fontFamily: 'DMSans',
//           //                         fontWeight: FontWeight.normal),
//           //                   ),
//           //                 ],
//           //               ),
//           //             ],
//           //           ),
//           //         ),
//           //       );
//           //     }),
//           ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               physics: const ClampingScrollPhysics(),
//               itemCount: 6,
//               itemBuilder: (context, int index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(bottom: 10.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(4),
//                         border:
//                         Border.all(color: const Color(0xffD4D4D5))),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 8),
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 24,
//                           // backgroundColor: Colors.grey,
//                           //
//                           backgroundImage: NetworkImage(
//                               'http://${controller.lstParty[index].vImg ?? ""}'),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Column(
//                           // crossAxisAlignment: CrossAxisAlignment.start,407149
//                           children: [
//                             Row(
//                               children: [
//                                 SizedBox(
//                                   width: 190,
//                                   child: Expanded(
//                                     child: Text(
//                                       '${controller.lstParty[index].vNAME} (${controller.lstParty[index].vTNAME})',
//                                       style: const TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w600),
//                                       // textAlign: TextAlign.end,817937
//                                     ),
//                                   ),
//                                 ),
//                                 Text(
//                                   ConvertFormat.convertDTFormat(
//                                       '${controller.lstParty[index].visitDATE}'),
//                                   style: const TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w600),
//                                   textAlign: TextAlign.end,
//                                 )
//                               ],
//                             ),
//                             Row(
//                               // mainAxisAlignment:
//                               //     MainAxisAlignment.spaceBetween,
//                               children: [
//                                 SizedBox(
//                                   width: 209,
//                                   child: Text(
//                                       '${controller.lstParty[index].vMEETTO}',
//                                       style:  TextStyle(
//                                           color: ColorsConstants.grey,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.normal)),
//                                 ),
//                                 Text(
//                                   '${controller.lstParty[index].visitINTIME}',
//                                   style:  TextStyle(
//                                       color: ColorsConstants.grey,
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.normal),
//                                   textAlign: TextAlign.end,
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//         ],
//       );
//     });
//   }
// }
