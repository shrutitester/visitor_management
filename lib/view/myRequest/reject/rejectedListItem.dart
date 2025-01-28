// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../controller/addProductController.dart';
// import '../../../model/getVisitorModel.dart';
// import '../../../utils/dateFormat.dart';
//
// class RejectedListItem extends StatefulWidget {
//   RejectedListItem(this.lstParty, {super.key});
//   LstParty lstParty;
//
//   @override
//   State<RejectedListItem> createState() => _RejectedListItemState();
// }
//
// class _RejectedListItemState extends State<RejectedListItem> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddProductController>(builder: (controller) {
//       return Padding(
//         padding: const EdgeInsets.only(bottom: 10),
//         child: InkWell(
//           onLongPress: () {},
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(4),
//                 border: Border.all(color: Colors.grey)),
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 25,
//                         // backgroundColor: Colors.grey,
//                         //
//                         backgroundImage:
//                             NetworkImage('http://${widget.lstParty.vImg}'),
//                       ),
//                       const SizedBox(
//                         width: 6,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceBetween,144693  134871
//                             children: [
//                               SizedBox(
//                                   width: 192,
//                                   child: Text(
//                                     '${widget.lstParty.vNAME}',
//                                     style: const TextStyle(
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.w600),
//                                   )),
//                               SizedBox(
//                                 width: 70,
//                                 child: Text(
//                                   ConvertFormat.convertDTFormat(
//                                       '${widget.lstParty.visitDATE}'),
//                                   style: const TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w600),
//                                   textAlign: TextAlign.end,
//                                 ),
//                               )
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SizedBox(
//                                   width: 220,
//                                   child: Text('${widget.lstParty.vMEETTO}',
//                                       style: const TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w300,))),
//                               Text('${widget.lstParty.visitOUTTIME}',
//                                   style: const TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w300,))
//                             ],
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 const Divider(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         // mainAxisAlignment: MainAxisAlignment.spaceBetween,144693  365248 757135
//                         children: [
//                           const Text(
//                             'Reason : ',
//                             style: TextStyle(
//                                 fontSize: 13, fontWeight: FontWeight.w600),
//                           ),
//                           Text(
//                             ConvertFormat.convertDTFormat(
//                                 '${widget.lstParty.visitDATE}'),
//                             style: const TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w300,),
//                             textAlign: TextAlign.end,
//                           )
//                         ],
//                       ),
//                       // Row(
//                       //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       //   children: [
//                       //     const Text(
//                       //       'Reschedule Date & Time : ',
//                       //       style: TextStyle(
//                       //           fontSize: 13, fontWeight: FontWeight.w600),
//                       //     ),
//                       //     Text('${widget.lstParty.visitOUTTIME}',
//                       //         style: const TextStyle(
//                       //             fontSize: 12,
//                       //             fontWeight: FontWeight.w300,))
//                       //   ],
//                       // ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
//
//