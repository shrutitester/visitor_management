import 'package:flutter/material.dart';
import 'package:visitor_management/view/visitorList/reject/rejectListItem.dart';
import 'package:get/get.dart';
import '../../../constants/colorConstants.dart';
import '../../../controller/addProductController.dart';

class RejectScreen extends StatefulWidget {
  const RejectScreen({super.key});

  @override
  State<RejectScreen> createState() => _RejectScreenState();
}

class _RejectScreenState extends State<RejectScreen> {
  final AddProductController _controller = Get.find();

  void rejected() async {
    if (_controller.lstLogin[0].type == 'Employee') {
      await _controller.getProfile(_controller.id ?? '', 'rejected', '', '',
          _controller.lstLogin[0].vID ?? '', "", "");
    } else if (_controller.lstLogin[0].type == 'Admin') {
      await _controller.getProfile(
          _controller.id ?? '', 'rejected', '', '', '', "", "");
    }
  }

  @override
  void initState() {
    rejected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(
        builder: (AddProductController controller) {
      return Container(
        color: ColorsConstants.white,
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
                  return RejectListItem(controller.lstParty[index]);
                }),
      );
    });
  }
}
