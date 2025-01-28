import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visitor_management/constants/colorConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';
import '../../commonWidget/roundButton.dart';
import '../../commonWidget/roundInputField.dart';
import '../../constants/stringConstants.dart';
import '../../constants/themeHelper.dart';
import '../../model/adminProfileModel.dart';
import '../../model/visitingTypeModel.dart';
import '../../utils/lotsOfThemes.dart';
import 'checkInProfileScreen.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController concernNameController = TextEditingController();
  TextEditingController referenceNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  VType? vType;
  LstAdmin? lstAdmin;
  String? type, dId, concern, reference, phoneNumber, purpose;
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
            'Check-in',
          ),
        ),
        backgroundColor: ColorsConstants.white,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: ColorsConstants.white,
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Department',
                        style: LotOfThemes.heading3,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 42,
                        child: DropdownSearch<VType>(
                          popupProps: PopupProps.dialog(
                            fit: FlexFit.loose,
                            dialogProps: DialogProps(
                                backgroundColor: ColorsConstants.white,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                                decoration: ThemeHelper()
                                    .textInputDecoration('Select', 'Search')),
                          ),
                          items: controller.department,
                          itemAsString: (VType v) => v.vTNAME ?? '',
                          dropdownDecoratorProps: DropDownDecoratorProps(
                              textAlignVertical: TextAlignVertical.bottom,
                              baseStyle: const TextStyle(
                                  overflow: TextOverflow.visible),
                              textAlign: TextAlign.left,
                              dropdownSearchDecoration: InputDecoration(
                                  hintText: StringConstants.selectIdType,
                                  hintStyle: LotOfThemes.txt14primary,
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF989898)),
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onChanged: (VType? value) async {
                            setState(() {
                              vType = value;
                              dId = vType?.vTID;
                            });
                            await controller.getConcern("", dId ?? '');
                          },
                          validator: (VType? value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Concern Person Name',
                        style: LotOfThemes.heading3,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 42,
                        child: DropdownSearch<LstAdmin>(
                          popupProps: PopupProps.dialog(
                            fit: FlexFit.loose,
                            dialogProps: DialogProps(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                                decoration: ThemeHelper()
                                    .textInputDecoration('Select', 'Search')),
                          ),
                          items: controller.lstAdmin,
                          itemAsString: (LstAdmin v) => v.aNAME ?? '',
                          dropdownDecoratorProps: DropDownDecoratorProps(
                              textAlignVertical: TextAlignVertical.bottom,
                              baseStyle: const TextStyle(
                                  overflow: TextOverflow.visible),
                              textAlign: TextAlign.left,
                              dropdownSearchDecoration: InputDecoration(
                                  hintText: StringConstants.selectIdType,
                                  hintStyle: LotOfThemes.txt14primary,
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF989898)),
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onChanged: (LstAdmin? value) {
                            setState(() {
                              lstAdmin = value;
                              concern = lstAdmin?.aID;
                            });
                          },
                          validator: (LstAdmin? value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Purpose',
                        style: LotOfThemes.heading3,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 42,
                        child: DropdownSearch<VType>(
                          popupProps: PopupProps.dialog(
                            fit: FlexFit.loose,
                            dialogProps: DialogProps(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                                decoration: ThemeHelper()
                                    .textInputDecoration('Select', 'Search')),
                          ),
                          items: controller.purposed,
                          itemAsString: (VType v) => v.vTNAME ?? '',
                          dropdownDecoratorProps: DropDownDecoratorProps(
                              textAlignVertical: TextAlignVertical.bottom,
                              baseStyle: const TextStyle(
                                  overflow: TextOverflow.visible),
                              textAlign: TextAlign.left,
                              dropdownSearchDecoration: InputDecoration(
                                  hintText: StringConstants.selectIdType,
                                  hintStyle: LotOfThemes.txt14primary,
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF989898)),
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onChanged: (VType? value) {
                            setState(() {
                              vType = value;
                              purpose = vType?.vTNAME;
                            });
                          },
                          validator: (VType? value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Reference Name',
                        style: LotOfThemes.heading3,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RoundedInputField(
                        controller: referenceNameController,
                        hintText: "Enter your reference name",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          reference = value;
                        },
                      ),
                      const Text(
                        'Reference Phone Number',
                        style: LotOfThemes.heading3,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      RoundedInputField(
                        controller: phoneNumberController,
                        hintText: "Enter your reference number",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        counterText: '',
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                      ),
                      const Text(
                        'Available Date & Time',
                        style: LotOfThemes.heading3,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 48,
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon:
                                  const Icon(Icons.calendar_month_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade50))),
                          controller:
                              TextEditingController(text: date.toString()),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: currentDate,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2100));
                            if (pickedDate != currentDate) {
                              setState(() {
                                currentDate = pickedDate!;
                                date = DateFormat("dd-MMM-yyyy")
                                    .format(pickedDate);
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
                        height: 10,
                      ),
                      RoundButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            if (concernNameController.toString() == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(StringConstants.username)));
                            } else if (date.toString() == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Date')));
                            } else if (_timeC.toString() == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('checkIn time')));
                            } else if (_timeO.toString() == '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("checkout time")));
                            } else {
                              await controller.getCheckIn(
                                  controller.lstLogin[0].vID ?? '',
                                  dId ?? "",
                                  concern ?? '',
                                  purpose ?? '',
                                  reference ?? '',
                                  phoneNumber ?? '',
                                  date,
                                  timeIn ?? '',
                                  timeOut ?? '');
                              if (controller.checkStatus == true) {
                                Get.to(CheckInProfileScreen(
                                    controller.checkIn[0].vAPPROVALID ?? ''));
                                Get.showSnackbar(
                                  GetSnackBar(
                                    title: controller.checkInMsg ?? 'value',
                                    message: controller.checkInMsg ?? 'qwerty',
                                    duration: const Duration(seconds: 4),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text(controller.checkInMsg ?? '')));
                              }
                            }
                          }
                        },
                        title: 'Check-in',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
