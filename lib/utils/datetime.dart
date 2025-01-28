//
// import 'dart:js';
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class DateTime {
//   DateTime currentDate = DateTime.now();
//   String date = DateFormat("dd-MMM-yyyy").format(DateTime.now());
//   String date2 = DateFormat("dd-MMM-yyyy").format(DateTime.now());
//
//   static dateTime () async {
//     DateTime pickedDate = (await showDatePicker(
//         context: context,
//         initialDate: currentDate,
//         firstDate: DateTime(2000),
//         lastDate: DateTime(2100))) as DateTime;
//   }
// }