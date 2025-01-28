import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:visitor_management/controller/addProductController.dart';
import '../../constants/stringConstants.dart';
import '../../model/chartAnalyticsModel.dart';

class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  final AddProductController _controller = Get.find();
  List<LstAnalytics> lstAnalytics = [];
  DateTimeRange? _selectedDates;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                StringConstants.analytics,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: _showSelectDatePicker,
                  child: Row(
                    children: [
                      Text(
                        '${formatDateToString(_selectedDates?.start)}'
                        ' - '
                        '${formatDateToString(_selectedDates?.end)}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 260,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffE0E0E0)),
                borderRadius: BorderRadius.circular(6)),
            child: BarChart(
                BarChartData(
                minY: 0,
                maxY: 25,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.transparent,
                        tooltipPadding: const EdgeInsets.symmetric(
                            horizontal: 3, vertical: 1))),
                titlesData: const FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: true, reservedSize: 23)),
                    leftTitles: AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: true, reservedSize: 35))),
                barGroups: controller.listAnalytics
                    .asMap()
                    .map((index, lstAnalytic) => MapEntry(
                        index,
                        BarChartGroupData(
                            x: int.parse(
                              controller.listAnalytics[index].vDAY.toString(),
                            ),
                            barsSpace: 4,
                            barRods: [
                              BarChartRodData(
                                toY: double.parse(controller
                                    .listAnalytics[index].vCOUNT
                                    .toString()),
                                width: 25,
                                color: const Color(0xff3537A6),
                                borderRadius: BorderRadius.circular(3),
                              )
                            ])))
                    .values
                    .toList())),
          )
        ],
      );
    });
  }

  String _formatDateToString(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  String formatDateToString(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('dd MMM').format(date);
  }

  Future _showSelectDatePicker() async {
    final result = await showDateRangePicker(
      context: context,
      initialDateRange: _selectedDates,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (result != null) {
      _selectedDates = result;
      if (_controller.lstLogin[0].type == "Employee") {
        await _controller.getChartAnalytics(
            _controller.lstLogin[0].vID,
            _formatDateToString(_selectedDates?.start),
            _formatDateToString(_selectedDates?.end));
      }
      else if (_controller.lstLogin[0].type == "Admin") {
        await _controller.getChartAnalytics(
            "",
            _formatDateToString(_selectedDates?.start),
            _formatDateToString(_selectedDates?.end));
      }
    }
  }
}
