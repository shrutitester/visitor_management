import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/constants/colorConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';

import '../../utils/lotsOfThemes.dart';

class HeadingAdminHome extends StatefulWidget {
  HeadingAdminHome(this.name, this.id, {super.key});
  String name;
  String id;
  @override
  State<HeadingAdminHome> createState() => _HeadingAdminHomeState();
}

class _HeadingAdminHomeState extends State<HeadingAdminHome> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello ${widget.name}',
            style: LotOfThemes.heading1,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                border: Border.all(color: ColorsConstants.primary),
                color: ColorsConstants.primary,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.lstAnalytics.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.lstAnalytics[index].vSTATUS ?? '',
                                  style: LotOfThemes.heading4,
                                ),
                                Text(
                                  controller.lstAnalytics[index].vCOUNT ?? '',
                                  style: LotOfThemes.heading4,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        );
                      })),
            ),
          )
        ],
      );
    });
  }
}

