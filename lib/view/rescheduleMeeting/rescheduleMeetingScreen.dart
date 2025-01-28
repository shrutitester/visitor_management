import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visitor_management/commonWidget/roundButton.dart';
import 'package:visitor_management/controller/addProductController.dart';
import '../../constants/colorConstants.dart';
import '../../model/visitingTypeModel.dart';
import '../../utils/lotsOfThemes.dart';
import '../main_tabview/main_tabview.dart';

class RescheduleScreen extends StatefulWidget {
  RescheduleScreen(this.id, this.approvalId, {super.key});
  String id;
  String approvalId;

  @override
  State<RescheduleScreen> createState() => _RescheduleScreenState();
}

class _RescheduleScreenState extends State<RescheduleScreen> {
  VType? vType;
  String? type;
  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  String date = DateFormat("dd-MMM-yyyy").format(DateTime.now());
  final _timeC = TextEditingController();
  final _timeO = TextEditingController();
  String? timeIn, timeOut;
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.white,
          centerTitle: true,
          title: const Text(
            'Reschedule Meeting',
            style: LotOfThemes.heading1,
          ),
        ),
        backgroundColor: ColorsConstants.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Available Date & Time',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "DMSans",
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    height: 48,
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.calendar_month_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade50))),
                      controller: TextEditingController(text: date.toString()),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: currentDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100));
                        if (pickedDate != currentDate) {
                          setState(() {
                            currentDate = pickedDate!;
                            date = DateFormat("dd-MMM-yyyy").format(pickedDate);
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.alarm),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade50))),
                      controller: _timeC,
                      readOnly: true,
                      onTap: () async {
                        var pickedTime = await showTimePicker(
                          context: context,
                          initialTime: _time,
                        );
                        if (pickedTime != _time) {
                          setState(() {
                            _time = pickedTime!;
                            _timeC.text =
                                "${pickedTime.hour}:${pickedTime.minute}";
                            timeIn = _timeC.text;
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.alarm),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade50))),
                      controller: _timeO,
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: time,
                        );
                        if (pickedTime != time) {
                          setState(() {
                            time = pickedTime!;
                            _timeO.text =
                                "${pickedTime.hour}:${pickedTime.minute}";
                            timeOut = _timeO.text;
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundButton(
                      onPressed: () async {
                        await controller.getReschedule(widget.id, date,
                            timeIn ?? '', timeOut ?? '', widget.approvalId);
                        Get.showSnackbar(
                          GetSnackBar(
                            title: controller.visitorStatus ?? 'value',
                            message: controller.visitorStatus ?? 'qwerty',
                            duration: const Duration(seconds: 4),
                          ),
                        );
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Image.asset('assets/images/check.png'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Reschedule Meeting Successfully !',
                                        style: TextStyle(fontSize: 15),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      RoundButton(
                                          onPressed: () {
                                            Get.to(const MainTabView());
                                          },
                                          title: 'Exit')
                                    ],
                                  ),
                                ));
                      },
                      title: 'Confirm')
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
