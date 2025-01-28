import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/controller/addProductController.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stylesConstants.dart';
import '../../model/getVisitorModel.dart';
import '../../utils/lotsOfThemes.dart';
import '../rejectMeeting/rejectMeetingScreen.dart';
import '../rescheduleMeeting/rescheduleMeetingScreen.dart';

class VisitorProfileScreen extends StatefulWidget {
  VisitorProfileScreen(this.lstParty, {super.key});
  LstParty lstParty;

  @override
  State<VisitorProfileScreen> createState() => _VisitorProfileScreenState();
}

class _VisitorProfileScreenState extends State<VisitorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.white,
          title: const Text(
            'Profile',
            style: LotOfThemes.heading1,
          ),
          centerTitle: true,
        ),
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
                      'http://${widget.lstParty.vImg ?? ""}',
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
                              width: 130,
                              child: Text(
                                'Name :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              widget.lstParty.vNAME ?? '',
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
                              width: 130,
                              child: Text(
                                'Gender :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              widget.lstParty.vGender ?? '',
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
                              width: 130,
                              child: Text(
                                'Purpose :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              widget.lstParty.vPURPOSE ?? '',
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
                              width: 130,
                              child: Text(
                                'Mobile Number :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              widget.lstParty.vPHONE ?? '',
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
                              width: 130,
                              child: Text(
                                'E-mail Address :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              widget.lstParty.vEMAIL ?? '',
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
                              width: 130,
                              child: Text(
                                'Company Name :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              widget.lstParty.vCompanyNAME ?? '',
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
                              width: 130,
                              child: Text(
                                'ID Proof :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              widget.lstParty.vTNAME ?? '',
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
                              width: 130,
                              child: Text(
                                'Department :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              widget.lstParty.dEPNAME ?? '',
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
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 2.3,
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xff35A648),
                              border:
                                  Border.all(color: const Color(0xff35A648)),
                              borderRadius: BorderRadius.circular(8)),
                          child: TextButton(
                              onPressed: () async {
                                setState(() {
                                  controller.getUpdateVisitor(
                                      widget.lstParty.vID ?? '',
                                      'Approved',
                                      'approved',
                                      widget.lstParty.vAPPROVALID ?? '');
                                  controller.getProfile(controller.id ?? '',
                                      'pending', '', '', "", "", "");
                                  Get.back();
                                });
                              },
                              child: const Text(
                                'Approve',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ))),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 2.3,
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xffDB772A),
                              border:
                                  Border.all(color: const Color(0xffDB772A)),
                              borderRadius: BorderRadius.circular(8)),
                          child: TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'More Details',
                                              style: AppStyles.boldText(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: ColorsConstants
                                                      .blackColor),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(RescheduleScreen(
                                                    widget.lstParty.vID ?? '',
                                                    widget.lstParty
                                                            .vAPPROVALID ??
                                                        ''));
                                              },
                                              child: Text(
                                                'Reschedule',
                                                style: AppStyles.boldText(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: ColorsConstants
                                                        .primary),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(RejectMeetingScreen(
                                                    widget.lstParty.vID ?? '',
                                                    widget.lstParty
                                                            .vAPPROVALID ??
                                                        ''));
                                              },
                                              child: Text(
                                                'Reject',
                                                style: AppStyles.boldText(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: ColorsConstants
                                                        .primary),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ));
                            },
                            child: const Text(
                              'More Details',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
