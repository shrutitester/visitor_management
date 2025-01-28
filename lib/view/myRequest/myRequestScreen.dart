// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:visitor_management/controller/addProductController.dart';
// import 'package:visitor_management/view/myRequest/reject/rejectedScreen.dart';
// import 'pending/pendingScreen.dart';
// import 'approved/approvedScreen.dart';
//
// class MyRequestScreen extends StatefulWidget {
//   const MyRequestScreen({super.key});
//
//   @override
//   State<MyRequestScreen> createState() => _MyRequestScreenState();
// }
//
// class _MyRequestScreenState extends State<MyRequestScreen>
//     with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//   int currentTabIndex = 0;
//   // String? dealerType = "";
//   Color? indicatorColor;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this)
//       ..addListener(() {
//         setState(() {
//           currentTabIndex = _tabController!.index;
//         });
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddProductController>(builder: (controller) {
//       return DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             title: const Text('My Request'),
//             bottom: TabBar(
//               tabAlignment: TabAlignment.start,
//               padding: const EdgeInsets.all(4.0),
//               isScrollable: true,
//               dividerHeight: 0,
//               indicatorSize: TabBarIndicatorSize.tab,
//               indicator: currentTabIndex == 0
//                   ? BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: const Color(0xff35A648))
//                   : currentTabIndex == 1
//                       ? BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: const Color(0xffD4BC24))
//                       : currentTabIndex == 2
//                           ? BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: const Color(0xffCC7D07))
//                           : BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               color: const Color(0xffE81F34)),
//               controller: _tabController,
//               labelColor: Colors.white,
//               tabs: [
//                 SizedBox(
//                   height: 35,
//                   child: Tab(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         // border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       width: 100,
//                       alignment: Alignment.center,
//                       child: const Text(
//                         'Approve',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 35,
//                   child: Tab(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         // border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       width: 100,
//                       alignment: Alignment.center,
//                       child: const Text(
//                         'Pending',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 35,
//                   child: Tab(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         // border: Border.all(color: Colors.grey),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       width: 100,
//                       alignment: Alignment.center,
//                       child: const Text(
//                         'Reschedule',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 35,
//                   child: Tab(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         // border: Border.all(color: Colors.grey), 421997
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       width: 100,
//                       alignment: Alignment.center,
//                       child: const Text(
//                         'Reject',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             controller: _tabController,
//             children:  [
//               ApprovedScreen(''),
//               PendingScreen(''),
//               Center(child: Text('data')),
//               RejectedScreen(),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
