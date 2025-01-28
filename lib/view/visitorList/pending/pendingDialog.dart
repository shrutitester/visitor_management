// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:visitor_management/controller/addProductController.dart';
//
// class PendingDialog extends StatefulWidget {
//   String id;
//   PendingDialog(this.id, {super.key});
//
//   @override
//   State<PendingDialog> createState() => _PendingDialogState();
// }
//
// class _PendingDialogState extends State<PendingDialog> {
//   DateTime currentDate = DateTime.now();
//   String date = DateFormat("dd-MMM-yyyy").format(DateTime.now());
//   final _timeC = TextEditingController();
//   TimeOfDay currentTime = TimeOfDay.now();
//   String? timeIn;
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddProductController>(builder: (controller){
//       return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//         color: Colors.white,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(widget.id),
//             SizedBox(
//               height: 50,
//               child: TextField(
//                 decoration: const InputDecoration(
//                   suffixIcon: Icon(Icons.calendar_month_outlined),
//                 ),
//                 controller: TextEditingController(text: date.toString()),
//                 readOnly: true,
//                 onTap: () async {
//                   DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: currentDate,
//                       firstDate: DateTime(2000),
//                       lastDate: DateTime(2100));
//                   if (pickedDate != currentDate) {
//                     setState(() {
//                       currentDate = pickedDate!;
//                       date = DateFormat("dd-MMM-yyyy").format(pickedDate);
//                     });
//                   }
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 50,
//               child: TextField(
//                 decoration: const InputDecoration(
//                   suffixIcon: Icon(Icons.alarm),
//                 ),
//                 controller: _timeC,
//                 readOnly: true,
//                 onTap: () async {
//                   var pickedTime = await showTimePicker(
//                     context: context,
//                     initialTime: currentTime,
//                   );
//                   if (pickedTime != currentTime) {
//                     setState(() {
//                       currentTime = pickedTime!;
//                       _timeC.text = "${pickedTime.hour}:${pickedTime.minute}";
//                       timeIn = _timeC.text;
//                     });
//                   }
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SizedBox(
//               width: 110,
//               child: ElevatedButton(
//                 onPressed: () {
//                   // controller.getReschedule(widget.id, date, timeIn??'');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   textStyle:
//                   const TextStyle(fontSize: 15, fontStyle: FontStyle.normal),
//                 ),
//                 child: const Text(
//                   'Submit',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
