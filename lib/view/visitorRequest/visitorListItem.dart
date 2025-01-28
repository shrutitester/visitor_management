import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/view/visitorRequest/visitorProfile.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stylesConstants.dart';
import '../../model/getVisitorModel.dart';
import '../../utils/dateFormat.dart';
import '../rejectMeeting/rejectMeetingScreen.dart';
import '../rescheduleMeeting/rescheduleMeetingScreen.dart';

class VisitorListItem extends StatefulWidget {
  VisitorListItem(this.lstParty, {super.key});
  LstParty lstParty;

  @override
  State<VisitorListItem> createState() => _VisitorListItemState();
}

class _VisitorListItemState extends State<VisitorListItem> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: InkWell(
          onTap: () {
            Get.to(VisitorProfileScreen(widget.lstParty));
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 1.25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey)),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: (25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            'http://${widget.lstParty.vImg ?? ""}',
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
                      const SizedBox(
                        width: 6,
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
                                    '${widget.lstParty.vNAME} (${ widget.lstParty.vPURPOSE})',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  ConvertFormat.convertDTFormat(
                                      '${widget.lstParty.visitDATE}'),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.end,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${widget.lstParty.vMEETTO}',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300)),
                                Text(
                                  '${widget.lstParty.visitOUTTIME}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.end,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(color: Colors.grey),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 2.8,
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
                          width: MediaQuery.of(context).size.width / 2.8,
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
                                            TextButton(
                                              onPressed: () {
                                                Get.to(RescheduleScreen(
                                                    widget.lstParty.vID ?? '',
                                                    widget.lstParty
                                                            .vAPPROVALID ??
                                                        ''));
                                              },
                                              child: Text(
                                                'Reschedule',
                                                style: AppStyles.boldText(
                                                  color:
                                                      ColorsConstants.primary,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Get.to(RejectMeetingScreen(
                                                    widget.lstParty.vID ?? '',
                                                    widget.lstParty
                                                            .vAPPROVALID ??
                                                        ''));
                                              },
                                              child: Text(
                                                'Reject',
                                                style: AppStyles.boldText(
                                                  color:
                                                      ColorsConstants.primary,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            )
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
