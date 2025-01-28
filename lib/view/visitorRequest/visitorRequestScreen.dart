import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/view/visitorRequest/visitorListItem.dart';

import '../../utils/lotsOfThemes.dart';

class VisitorRequest extends StatefulWidget {
  const VisitorRequest({super.key});

  @override
  State<VisitorRequest> createState() => _VisitorRequestState();
}

class _VisitorRequestState extends State<VisitorRequest> {
  final AddProductController _controller = Get.find();

  @override
  void initState() {
    // request();
    super.initState();
  }

  void request() async {
    await _controller.getProfile(
        _controller.id ?? '', 'pending', '', '', "", "", "");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return controller.lstParty.isEmpty
          ? const SizedBox.shrink()
          : Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Visitor Request',
                      style: LotOfThemes.heading1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 152.0,
                  child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.lstParty.length,
                      itemBuilder: (BuildContext context, int index) =>
                          VisitorListItem(controller.lstParty[index])),
                ),
              ],
            );
    });
  }
}
