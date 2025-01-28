import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/commonWidget/roundButton.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/utils/lotsOfThemes.dart';
import '../../commonWidget/roundInputField.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstants.dart';
import '../main_tabview/main_tabview.dart';

class RejectMeetingScreen extends StatefulWidget {
  RejectMeetingScreen(this.id, this.approvalId, {super.key});
  String id;
  String approvalId;

  @override
  State<RejectMeetingScreen> createState() => _RejectMeetingScreenState();
}

class _RejectMeetingScreenState extends State<RejectMeetingScreen> {
  TextEditingController reasonController = TextEditingController();
  String? reason;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.white,
          centerTitle: true,
          title: const Text('Reject Meeting', style: LotOfThemes.heading1),
        ),
        backgroundColor: ColorsConstants.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reason',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "DMSans",
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  RoundedInputField(
                    controller: reasonController,
                    hintText: "Enter your name",
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    type: StringConstants.username,
                    maxLines: 1,
                    onChanged: (value) {
                      reason = value;
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RoundButton(
                      onPressed: () async {
                        await controller.getUpdateVisitor(widget.id, 'Rejected',
                            reason ?? "", widget.approvalId);
                        await controller.getProfile(
                            controller.id ?? '', 'pending', '', '', controller.lstLogin[0].vID ?? "", "","");
                        Get.to(const MainTabView());
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
