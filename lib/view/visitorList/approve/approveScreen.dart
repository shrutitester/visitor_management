import'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/constants/colorConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'approveListItem.dart';

class ApprovedScreen extends StatefulWidget {
  const ApprovedScreen({super.key});

  @override
  State<ApprovedScreen> createState() => _ApprovedScreenState();
}

class _ApprovedScreenState extends State<ApprovedScreen> {
  final AddProductController _controller = Get.find();

  @override
  void initState() {
    approved();
    super.initState();
  }

  void approved() async {
    if (_controller.lstLogin[0].type == 'Employee') {
      await _controller.getProfile(_controller.id ?? '', 'approved', '', '',
          _controller.lstLogin[0].vID ?? '', "", "");
    } else if (_controller.lstLogin[0].type == 'Admin') {
      await _controller.getProfile(
          _controller.id ?? '', 'approved', '', '', '', "", "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Container(
        color: ColorsConstants.white,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: controller.lstParty.isEmpty
            ? const Center(
              child: Text("no item"),
            )
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemCount: controller.lstParty.length,
                itemBuilder: (context, int index) {
                  return ApprovedListItem(controller.lstParty[index]);
                }),
      );
    });
  }
}
