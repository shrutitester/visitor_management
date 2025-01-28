import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:visitor_management/controller/addProductController.dart';
import '../../constants/colorConstants.dart';
import '../../utils/dateFormat.dart';
import 'dashboard.dart';
import 'headingVisitorHome.dart';

class VisitorHomeScreen extends StatefulWidget {
  const VisitorHomeScreen({super.key});

  @override
  State<VisitorHomeScreen> createState() => _VisitorHomeScreenState();
}

class _VisitorHomeScreenState extends State<VisitorHomeScreen> {
  final AddProductController _controller = Get.find();
  String data = "Hello, QR Code!";
  String date = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  String afterDate = DateFormat('dd-MMM-yyyy')
      .format(DateTime.now().add(const Duration(days: 7)));

  @override
  void initState() {
    homePage();
    super.initState();
  }

  void homePage() async {
    await _controller.getProfile(
        _controller.lstLogin[0].vID ?? '', '', date, afterDate, '', '', "");
    await _controller.getAnalytics(_controller.lstLogin[0].vID ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsConstants.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                HeadingVisitorHome(_controller.lstLogin[0].vNAME ?? '',
                    _controller.lstLogin[0].vID ?? ''),
                const SizedBox(
                  height: 20,
                ),
                Dashboard(_controller.lstLogin[0].vID ?? ''),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Scheduled visits this week',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    controller.lstParty.isEmpty
                        ? const Center(
                            child: Text("No item"),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const ClampingScrollPhysics(),
                            itemCount: controller.lstParty.length,
                            itemBuilder: (context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: InkWell(
                                  onLongPress: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  QrImageView(
                                                    data: controller
                                                            .lstParty[index]
                                                            .vAPPROVALID ??
                                                        '',
                                                    version: QrVersions.min,
                                                    size: 200.0,
                                                  )
                                                ],
                                              ),
                                            ));
                                  },
                                  child: Column(
                                    children: [
                                      controller.lstParty[index].visitDATE!
                                              .isNotEmpty
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffD4D4D5))),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 8),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: CircleAvatar(
                                                      radius: 24,
                                                      child: Image.network(
                                                        'http://${controller.lstParty[index].vImg ?? ""}',
                                                        errorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object
                                                                    exception,
                                                                StackTrace?
                                                                    stackTrace) {
                                                          return Image.asset(
                                                            "assets/images/user.png",
                                                            fit: BoxFit.fill,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    flex: 8,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                '${controller.lstParty[index].vNAME} (${controller.lstParty[index].vSTATUS})',
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            Text(
                                                              controller
                                                                      .lstParty[
                                                                          index]
                                                                      .visitDATE!
                                                                      .isNotEmpty
                                                                  ? ConvertFormat
                                                                      .convertDTFormat(
                                                                          '${controller.lstParty[index].visitDATE}')
                                                                  : '',
                                                              style: const TextStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                              textAlign:
                                                                  TextAlign.end,
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              child: Text(
                                                                  '${controller.lstParty[index].vMEETTO}',
                                                                  style: TextStyle(
                                                                      color: ColorsConstants
                                                                          .grey,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal)),
                                                            ),
                                                            Text(
                                                              '${controller.lstParty[index].visitINTIME}',
                                                              style: TextStyle(
                                                                  color:
                                                                      ColorsConstants
                                                                          .grey,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                              textAlign:
                                                                  TextAlign.end,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ),
                              );
                            }),
                  ],
                )
              ],
            ),
          ),
        )),
      );
    });
  }
}
