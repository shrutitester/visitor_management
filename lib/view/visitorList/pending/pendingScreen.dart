import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/view/visitorList/pending/pendingListItem.dart';
import '../../../constants/colorConstants.dart';
import '../../../controller/addProductController.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({super.key});

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  final AddProductController _controller = Get.find();

  @override
  void initState() {
    pending();
    super.initState();
  }

  void pending() async {
    if (_controller.lstLogin[0].type == 'Employee') {
      await _controller.getProfile(_controller.lstLogin[0].vID ?? '', 'pending', '', '',
           '', "", "");
    } else if (_controller.lstLogin[0].type == 'Admin') {
      await _controller.getProfile(
          '', 'pending', '', '', '', "", "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(
        builder: (AddProductController controller) {
      return Container(
        color: ColorsConstants.white,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10.0),
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
                  return PendingListItem(controller.lstParty[index]);
                }),
      );
    });
  }
}
