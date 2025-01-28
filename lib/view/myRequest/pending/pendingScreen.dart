import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../constants/colorConstants.dart';
import '../../../controller/addProductController.dart';
import '../../../view/myRequest/pending/pendingListItem.dart';

class PendingScreen extends StatefulWidget {
  PendingScreen(this.id, {super.key});
  String id;
  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  String date = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  String afterDate = DateFormat('dd-MMM-yyyy')
      .format(DateTime.now().add(const Duration(days: 7)));
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('My Request'),
          backgroundColor: ColorsConstants.white,
          leading: IconButton(
            onPressed: () async {
              await controller.getProfile(controller.lstLogin[0].vID ?? '', '',
                  date , afterDate , "", "","");
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
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                itemCount: controller.lstParty.length,
                itemBuilder: (context, int index) {
                  return PendingListItem(controller.lstParty[index]);
                }),
      ); //184304
    });
  }
}
