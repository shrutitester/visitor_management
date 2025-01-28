//import 'package:fl_chart/fl_chart.dart';
//import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:visitor_management/constants/stringConstants.dart';
//import 'package:visitor_management/controller/addProductController.dart';
//import 'package:intl/intl.dart';
//import '../../model/getAnalyticsModel.dart';
//
//class Analytics extends StatefulWidget {
//  const Analytics({super.key});
//  @override
//  State<Analytics> createState() => _AnalyticsState();
//}
//
//class _AnalyticsState extends State<Analytics> {
//  final AddProductController _controller = Get.find();
//  List<LstAnalytic> lstAnalytic = [];
//  DateTimeRange? _selectedDates;
//
//  @override
//  Widget build(BuildContext context) {
//    return GetBuilder<AddProductController>(builder: (controller) {
//      return Column(
//        children: [
//          const SizedBox(
//            height: 15,
//          ),
//          Padding(
//            padding: const EdgeInsets.only(left: 10.0, right: 5),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                const Text(
//                  StringConstants.analytics,
//                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                ),
//                TextButton(
//                    onPressed: _showSelectDatePicker,
//                    child: Row(
//                      children: [
//                        Text(
//                          '${formatDateToString(_selectedDates?.start)}'
//                          ' - '
//                          '${formatDateToString(_selectedDates?.end)}',
//                          style: const TextStyle(
//                              color: Colors.black, fontSize: 15),
//                        ),
//                        const Icon(Icons.keyboard_arrow_down_rounded)
//                      ],
//                    ))
//              ],
//            ),
//          ),
//          const SizedBox(
//            height: 15,
//          ),
//          Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 10.0),
//            child: Container(
//              height: 250,
//              padding: const EdgeInsets.symmetric(vertical: 30),
//              decoration: BoxDecoration(
//                  border: Border.all(color: const Color(0xffE0E0E0)),
//                  borderRadius: BorderRadius.circular(6)),
//              child: BarChart(
//                  BarChartData(
//                  minY: 0,
//                  maxY: 25,
//                  gridData: FlGridData(show: false),
//                  borderData: FlBorderData(show: false),
//                  barTouchData: BarTouchData(
//                      touchTooltipData: BarTouchTooltipData(
//                          tooltipBgColor: Colors.white,
//                          tooltipPadding: const EdgeInsets.only(bottom: 0))),
//                  titlesData: FlTitlesData(
//                      show: true,
//                      topTitles:
//                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                      rightTitles:
//                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
//                      bottomTitles: AxisTitles(
//                          sideTitles: SideTitles(
//                        showTitles: true,
//                      ))),
//                  barGroups: controller.lstAnalytic
//                      .asMap()
//                      .map((index, lstAnalytic) => MapEntry(
//                          index,
//                          BarChartGroupData(
//                              x: int.parse(controller.lstAnalytic[index].vDAY
//                                  .toString()),
//                              barsSpace: 4,
//                              barRods: [
//                                BarChartRodData(
//                                  toY: double.parse(controller
//                                      .lstAnalytic[index].vCOUNT
//                                      .toString()),
//                                  width: 25,
//                                  color: const Color(0xff3537A6),
//                                  borderRadius: BorderRadius.circular(3),
//                                )
//                              ])))
//                      .values
//                      .toList())),
//            ),
//          )
//        ],
//      );
//    });
//  }
//  String _formatDateToString(DateTime? date) {
//    if (date == null) return '-';
//    return DateFormat('dd-MMM-yyyy').format(date);
//  }
//  String formatDateToString(DateTime? date) {
//    if (date == null) return '-';
//    return DateFormat('dd MMM').format(date);
//  }
//  Future _showSelectDatePicker() async {
//    final result = await showDateRangePicker(
//      context: context,
//      initialDateRange: _selectedDates,
//      firstDate: DateTime(2000),
//      lastDate: DateTime(2100),
//    );
//    if (result != null) {
//      setState(() async {
//        _selectedDates = result;
//        await _controller.getAnalytics(
//            _formatDateToString(_selectedDates?.start),
//            _formatDateToString(_selectedDates?.end));
//      });
//    }
//  }
//}















import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visitor_management/controller/addProductController.dart';

import '../../utils/dateFormat.dart';

class WeeklyList extends StatefulWidget {
  const WeeklyList({super.key});

  @override
  State<WeeklyList> createState() => _WeeklyListState();
}

class _WeeklyListState extends State<WeeklyList> {
  final AddProductController _controller = Get.find();
  String date = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  String afterDate = DateFormat('dd-MMM-yyyy')
      .format(DateTime.now().add(const Duration(days: 3)));

  @override
  void initState() {
    // weekly();
    super.initState();
  }

  void weekly() async {
    await _controller.getProfile('', '', date, afterDate, '', '',"");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          itemCount: (controller.visitor.length >= 4
              ? 4
              : controller.visitor.length >= 3
                  ? 3
                  : controller.visitor.length == 2
                      ? 2
                      : 1),
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CircleAvatar(
                        radius: (25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            'http://${controller.visitor[index].vImg ?? ""}',
                            fit: BoxFit.contain,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset(
                                "assets/images/user.png",
                                fit: BoxFit.fill,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '${controller.visitor[index].vNAME} (${controller.visitor[index].vPURPOSE})',
                                  style: const TextStyle(
                                      fontSize: 13, fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(
                                ConvertFormat.convertDTFormat(
                                    '${controller.visitor[index].visitDATE}'),
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${controller.visitor[index].vMEETTO}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300)),
                              Text(
                                '${controller.visitor[index].visitINTIME}',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                                textAlign: TextAlign.end,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
