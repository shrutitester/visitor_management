import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visitor_management/constants/colorConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'approvedListItem.dart';

class ApprovedScreen extends StatefulWidget {
  ApprovedScreen(this.id, {super.key});
  String id;

  @override
  State<ApprovedScreen> createState() => _ApprovedScreenState();
}

class _ApprovedScreenState extends State<ApprovedScreen> {
  String date = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  String afterDate = DateFormat('dd-MMM-yyyy')
      .format(DateTime.now().add(const Duration(days: 7)));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.white,
          centerTitle: true,
          title: const Text('My Visit'),
          leading: IconButton(
            onPressed: () async {
              await controller.getProfile(controller.lstLogin[0].vID ?? '', '',
                  date, afterDate, "", "", "");
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorsConstants.blackColor,
            ),
          ),
        ),
        backgroundColor: ColorsConstants.white,
        body: controller.lstParty.isEmpty
            ? const Center(child: Text('no data'))
            : Container(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    itemCount: controller.lstParty.length,
                    itemBuilder: (context, int index) {
                      return ApprovedListItem(controller.lstParty[index]);
                    }),
              ),
      );
    });
  }
}
