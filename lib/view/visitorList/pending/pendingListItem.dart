import 'package:flutter/material.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/view/rejectMeeting/rejectMeetingScreen.dart';
import 'package:visitor_management/view/rescheduleMeeting/rescheduleMeetingScreen.dart';
import '../../../constants/colorConstants.dart';
import '../../../constants/stylesConstants.dart';
import '../../../model/getVisitorModel.dart';
import 'package:get/get.dart';
import '../../../utils/dateFormat.dart';
import '../../visitorRequest/visitorProfile.dart';

class PendingListItem extends StatefulWidget {
  PendingListItem(this.lstParty, {super.key});
  LstParty lstParty;

  @override
  State<PendingListItem> createState() => _PendingListItemState();
}

class _PendingListItemState extends State<PendingListItem> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: InkWell(
          onTap: () {
            Get.to(VisitorProfileScreen(widget.lstParty));
          },
          child: Container(
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
                      Expanded(
                        flex: 2,
                        child: CircleAvatar(
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
                                Text(
                                  '${widget.lstParty.vNAME}',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
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
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 2.35,
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xff35A648),
                              border:
                                  Border.all(color: const Color(0xff35A648)),
                              borderRadius: BorderRadius.circular(8)),
                          child: TextButton(
                              onPressed: () async {
                                await controller.getUpdateVisitor(
                                    widget.lstParty.vID ?? '',
                                    'Approved',
                                    '',
                                    widget.lstParty.vAPPROVALID ?? '');
                                if (controller.lstLogin[0].type == 'Admin') {
                                  await controller.getProfile(
                                      "", 'pending', '', '', "", "", "");
                                } else if (controller.lstLogin[0].type ==
                                    'Employee') {
                                  await controller.getProfile(
                                      "",
                                      'pending',
                                      '',
                                      '',
                                      controller.lstLogin[0].vID ?? "",
                                      "",
                                      "");
                                }
                              },
                              child: const Text('Approve',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  )))),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width / 2.35,
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
                                                        widget.lstParty.vID ??
                                                            '',
                                                        widget.lstParty
                                                                .vAPPROVALID ??
                                                            ''));
                                                  },
                                                  child: Text(
                                                    'Reschedule',
                                                    style: AppStyles.boldText(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: ColorsConstants.primary
                                                    ),
                                                  )),
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
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    color: ColorsConstants.primary,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ));
                              },
                              child: const Text(
                                'More Details',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ))),
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
