import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/view/home/weeklyList.dart';
import 'package:visitor_management/view/home/historyScreen.dart';
import 'package:visitor_management/view/home/upcoming.dart';
import '../../constants/colorConstants.dart';
import '../../utils/lotsOfThemes.dart';
import '../visitorRequest/VisitorRequestScreen.dart';
import 'adminHeading.dart';
import 'analytics.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AddProductController productController = Get.put(AddProductController());
  final AddProductController _controller = Get.find();
  String date = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  String afterDate = DateFormat('dd-MMM-yyyy')
      .format(DateTime.now().add(const Duration(days: 7)));

  void home() async {
    if (_controller.lstLogin[0].type == 'Employee') {
      await _controller.getVisitorList(
          "", date, _controller.lstLogin[0].vID ?? '');
      await _controller.getUpcomingList(
          date, date, _controller.lstLogin[0].vID ?? '');
      await _controller.getAnalyticsHome(_controller.lstLogin[0].vID ?? '');
      await _controller.getProfile(_controller.id ?? '', 'pending', '', '',
          _controller.lstLogin[0].vID ?? '', "", "");
    } else if (_controller.lstLogin[0].type == 'Admin') {
      await _controller.getProfile(
          _controller.id ?? '', 'pending', '', '', '', "", "");
      await _controller.getVisitorList("", date, '');
      await _controller.getUpcomingList(date, date, '');
      await _controller.getAnalyticsHome("");
    }
  }

  @override
  void initState() {
    home();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorsConstants.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView(shrinkWrap: true, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                HeadingAdminHome(_controller.lstLogin[0].vNAME ?? '',
                    _controller.lstLogin[0].vID ?? ''),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Analytics(),
            const Upcoming(),
            const VisitorRequest(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Visitor History',
                        style: LotOfThemes.heading1,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(const HistoryScreen());
                          },
                          child: const Text("View All"))
                    ],
                  ),
                  controller.visitor.isEmpty
                      ? const Center(
                          child: Text('No item'),
                        )
                      : const WeeklyList()
                ],
              ),
            )
          ]),
        ),
      );
    });
  }

}
