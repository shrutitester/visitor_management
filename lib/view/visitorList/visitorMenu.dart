import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/constants/stringConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/view/visitorList/pending/pendingScreen.dart';
import 'package:visitor_management/view/visitorList/reject/rejectScreen.dart';
import '../../constants/colorConstants.dart';
import 'approve/approveScreen.dart';

class VisitorMenu extends StatefulWidget {
  const VisitorMenu({super.key});

  @override
  State<VisitorMenu> createState() => _VisitorMenuState();
}

class _VisitorMenuState extends State<VisitorMenu>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int currentTabIndex = 0;
  String? dealerType = "";
  Color? indicatorColor;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {
          currentTabIndex = _tabController!.index;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorsConstants.white,
              centerTitle: true,
              title: const Text(StringConstants.visitorList),
              bottom: TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                dividerHeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: currentTabIndex == 0
                    ? BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff055D2A))
                    : currentTabIndex == 1
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffDADA0E))
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffD32B0A)),
                controller: _tabController,
                labelColor: Colors.white,
                tabs: [
                  SizedBox(
                    height: 35,
                    child: Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 80,
                        alignment: Alignment.center,
                        child: const Text(
                          'Approve',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 80,
                        alignment: Alignment.center,
                        child: const Text(
                          'Pending',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    child: Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 80,
                        alignment: Alignment.center,
                        child: const Text(
                          'Reject',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: const [
                ApprovedScreen(),
                PendingScreen(),
                RejectScreen(),
              ],
            )),
      );
    });
  }
}

//381786
