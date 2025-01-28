import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/view/home/upcomingListItem.dart';

import '../../utils/lotsOfThemes.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return controller.upcoming.isEmpty
          ? const SizedBox()
          : Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today Upcoming Visit',
                      style: LotOfThemes.heading1,
                    ),
                    // TextButton(
                    //     onPressed: () {
                    //       Get.to(const HistoryScreen());
                    //     },
                    //     child: const Text("View All"))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 75,
                  child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: (controller.upcoming.length
                          // >= 4
                          // ? 4
                          // : controller.upcoming.length >= 3
                          //     ? 3
                          //     : controller.upcoming.length == 2
                          //         ? 2
                          //         : 1
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return UpcomingListItem(controller.upcoming[index]);
                      }),
                ),
              ],
            );
    });
  }
}
