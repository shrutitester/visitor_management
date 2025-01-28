import 'package:flutter/material.dart';
import 'package:visitor_management/view/home/homeScreen.dart';
import '../../constants/colorConstants.dart';
import '../profile/adminProfileScreen.dart';
import '../qr/QrScreen.dart';
import '../visitorList/visitorMenu.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  final List<Widget> _widgets = [
    const HomeScreen(),
    const VisitorMenu(),
    const QrScreen(),
    const AdminProfileScreen(),
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
          unselectedItemColor: const Color(0xffBDBDBD),
          unselectedLabelStyle: const TextStyle(color: Color(0xffBDBDBD)),
          items: [
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/home-1.png'),
                icon: Image.asset('assets/images/home.png'),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/Visitor.png'),
                icon: Image.asset('assets/images/Visitor-1.png'),
                label: 'Visitor'),
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/images/qr-code-1.png'),
                icon: Image.asset('assets/images/qr-code.png'),
                label: 'Scan QR'),
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
        ));
  }
}
