import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/utils/dateFormat.dart';
import '../../commonWidget/roundButton.dart';
import '../../constants/colorConstants.dart';
import '../../utils/lotsOfThemes.dart';
import '../checkInQr/checkInQrScreen.dart';
import '../visitor_tabview/visitor_tabview.dart';

class CheckInProfileScreen extends StatefulWidget {
  CheckInProfileScreen(this.id, {super.key});
  String id;
  @override
  State<CheckInProfileScreen> createState() => _CheckInProfileScreenState();
}

class _CheckInProfileScreenState extends State<CheckInProfileScreen> {
  final AddProductController _controller = Get.find();

  @override
  void initState() {
    checkIn();
    super.initState();
  }

  void checkIn() async {
    await _controller.getProfile("", "", "", "", "", widget.id,"");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorsConstants.white,
            title: const Text(
              'Check-in',
              style: LotOfThemes.heading1,
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.off(const VisitorTabview());
                },
                icon: const Icon(Icons.arrow_back))),
        backgroundColor: ColorsConstants.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
            child: Column(
              children: [
                CircleAvatar(
                  radius: (50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      'http://${controller.checkIn[0].vImg ?? ''}',
                      fit: BoxFit.contain,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          "assets/images/user.png",
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffE4E4E4),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'Name :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.checkIn[0].vNAME ?? '',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'Gender :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.checkIn[0].vGender ?? '',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'Mobile Number :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.checkIn[0].vPHONE ?? '',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'E-mail Address :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.checkIn[0].vEMAIL ?? '',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'Company Name :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.checkIn[0].vCompanyNAME ?? '',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'ID Proof :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.checkIn[0].vIDTypeName ?? '',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'Department :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.checkIn[0].dEPNAME ?? '',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'Concern Person Name :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.checkIn[0].vMEETTO ?? '',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'Purpose :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.checkIn[0].vPURPOSE ?? '',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'Reference Name :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.checkIn[0].rEFNAME ?? '',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'Reference Phone Number :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.checkIn[0].rEFNO ?? '',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 150,
                              child: Text(
                                'Check-in Date & Time :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              '${ConvertFormat.convertDTFormat('${controller.checkIn[0].visitDATE}')} ${controller.checkIn[0].visitINTIME}',
                              style: const TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                RoundButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset('assets/images/check.png'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Your request has been successfully submitted, a QR with a quick guide will be sent to you upon notification. Once you receive approval.View QR',
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RoundButton(
                                      onPressed: () {
                                        Get.to(CheckInQrScreen(
                                            controller.checkIn[0].vAPPROVALID ??
                                                ''));
                                      },
                                      title: 'Exit')
                                ],
                              ),
                            ));
                  },
                  title: 'Confirm',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
