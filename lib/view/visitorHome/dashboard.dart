import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/constants/colorConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';
import '../../utils/lotsOfThemes.dart';
import '../myRequest/approved/approvedScreen.dart';
import '../myRequest/pending/pendingScreen.dart';

class Dashboard extends StatefulWidget {
  Dashboard(this.id, {super.key});
  String id;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Dashboard',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'DMSans',
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  id = widget.id;
                  Get.to(PendingScreen(id ?? ''));
                  await controller.getProfile(
                      widget.id, 'pending', '', '', "", "", "");
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.17,
                  decoration: BoxDecoration(
                      color: ColorsConstants.lightGreen,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text(
                    'My Request',
                    style: LotOfThemes.heading4,
                  )),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () async {
                  Get.to(ApprovedScreen(id ?? ''));
                  await controller.getProfile(
                      widget.id, 'approved', '', '', "", "", "");
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.17,
                  decoration: BoxDecoration(
                      color: ColorsConstants.lightYellow,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text(
                    'My Visit',
                    style: LotOfThemes.heading4,
                  )),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
