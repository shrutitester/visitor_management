import 'package:flutter/material.dart';
import 'package:visitor_management/constants/colorConstants.dart';
import '../checkIn/checkInScreen.dart';
import '../checkoutScreen/checkoutScreen.dart';
import '../profile/profileScreen.dart';
import '../visitorHome/visitorHomeScreen.dart';

class VisitorTabview extends StatefulWidget {
  const VisitorTabview({super.key});

  @override
  State<VisitorTabview> createState() => _VisitorTabviewState();
}

class _VisitorTabviewState extends State<VisitorTabview>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  final List<Widget> _widgets = [
    const VisitorHomeScreen(),
    const CheckInScreen(),
    const CheckOutScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsConstants.white,
        child: Center(
          child: _widgets[selectTab],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsConstants.white,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xffE50019),
        unselectedItemColor: const Color(0xff000000),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xff000000),
        ),
        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset('assets/images/home-1.png'),
              icon: Image.asset('assets/images/home.png'),
              label: 'Home'),
          BottomNavigationBarItem(
              activeIcon: Image.asset('assets/images/check in-1.png'),
              icon: Image.asset('assets/images/check in.png'),
              label: 'Check-in'),
          BottomNavigationBarItem(
              activeIcon: Image.asset('assets/images/check out-1.png'),
              icon: Image.asset('assets/images/check out.png'),
              label: 'Check-out'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/images/profile.png'),
              label: 'Profile'),
        ],
        currentIndex: selectTab,
        onTap: (int index) {
          setState(() {
            selectTab = index;
          });
        },
      ),
    );
  }
}
