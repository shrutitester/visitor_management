import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visitor_management/commonWidget/roundButton.dart';

import 'package:visitor_management/constants/colorConstants.dart';
import 'package:visitor_management/constants/themeHelper.dart';
import 'package:visitor_management/controller/addProductController.dart';

import '../../constants/stringConstants.dart';
import '../../model/visitingTypeModel.dart';
import '../../utils/lotsOfThemes.dart';
import 'historyListItem.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final AddProductController _controller = Get.find();
  DateTimeRange? _selectedDates;
  VType? vType;
  String? dId;
  String date3 = DateFormat("dd-MMM-yyyy").format(DateTime.now());


  @override
  void initState() {
    weekly();
    super.initState();
  }

  void weekly() async {
    if (_controller.lstLogin[0].type == 'Employee') {
      await _controller.getProfile(
          '', '', '', date3, _controller.lstLogin[0].vID ?? '', '',  '');
    } else if (_controller.lstLogin[0].type == 'Admin') {
      await _controller.getProfile('', '', '', date3, '', '',  '');
    }
  }

  String formatDateToString(DateTime? date) {
    if (date == null) return '';
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.white,
          title: const Text(
            "Visitor History",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(1.0)),
                      ),
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                color: ColorsConstants.blackColor,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Filter",
                                        style: TextStyle(
                                            color: ColorsConstants.white),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: Icon(
                                          Icons.cancel,
                                          color: ColorsConstants.white,
                                        ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 10),
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Colors.grey)),
                                    height: 45,
                                    child: TextButton(
                                        onPressed: () async {
                                          final result =
                                              await showDateRangePicker(
                                            context: context,
                                            initialDateRange: _selectedDates,
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2100),
                                          );

                                          if (result != null) {
                                            setState(() {
                                              _selectedDates = result;
                                            });
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${formatDateToString(_selectedDates?.start)}'
                                              ' - '
                                              '${formatDateToString(_selectedDates?.end)}',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                            ),
                                            const Icon(Icons
                                                .keyboard_arrow_down_rounded)
                                          ],
                                        ))),
                              ),
                              controller.lstLogin[0].type == "Admin"
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          const Text(
                                            "Department",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          SizedBox(
                                            height: 42,
                                            child: DropdownSearch<VType>(
                                                popupProps: PopupProps.dialog(
                                                    fit: FlexFit.loose,
                                                    dialogProps: DialogProps(
                                                        backgroundColor:
                                                            ColorsConstants
                                                                .white,
                                                        shape: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    5))),
                                                    showSearchBox: true,
                                                    searchFieldProps: TextFieldProps(
                                                        decoration: ThemeHelper()
                                                            .textInputDecoration(
                                                                'Select',
                                                                "Search"))),
                                                items: controller.department,
                                                itemAsString: (VType v) =>
                                                    v.vTNAME ?? '',
                                                dropdownDecoratorProps: DropDownDecoratorProps(
                                                    textAlignVertical:
                                                        TextAlignVertical.bottom,
                                                    baseStyle: const TextStyle(overflow: TextOverflow.visible),
                                                    textAlign: TextAlign.left,
                                                    dropdownSearchDecoration: InputDecoration(hintText: StringConstants.selectIdType, hintStyle: LotOfThemes.txt14primary, border: OutlineInputBorder(borderSide: const BorderSide(color: Color(0xFF989898)), borderRadius: BorderRadius.circular(4)))),
                                                onChanged: (VType? value) {
                                                  setState(
                                                    () {
                                                      vType = value;
                                                      dId = vType?.vTID;
                                                    },
                                                  );
                                                },
                                                validator: (VType? value) {
                                                  if (value == null) {
                                                    return "Required field";
                                                  } else {
                                                    return null;
                                                  }
                                                }),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RoundButton(
                                              onPressed: () async {
                                                await controller.getProfile(
                                                    '',
                                                    '',
                                                    formatDateToString(
                                                        _selectedDates?.start),
                                                    formatDateToString(
                                                        _selectedDates?.end),
                                                    '',
                                                    '',
                                                    dId ?? '');
                                                Get.back();
                                              },
                                              title: "Submit")
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          );
                        });
                      });
                },
                icon: const Icon(Icons.filter_list)),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        backgroundColor: ColorsConstants.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.lstParty.length,
              itemBuilder: (context, index) {
                return HistoryListItem(controller.lstParty[index]);
              }),
        ),
      );
    });
  }
}
