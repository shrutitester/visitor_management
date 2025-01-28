import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/view/login/loginScreen.dart';
import '../constants/colorConstants.dart';
import '../controller/addProductController.dart';

class DecisionScreen extends StatefulWidget {
  const DecisionScreen({super.key});

  @override
  State<DecisionScreen> createState() => _DecisionScreenState();
}

class _DecisionScreenState extends State<DecisionScreen> {
  AddProductController productController = Get.put(AddProductController());

  @override
  void initState() {
    _timerNavigate();
    super.initState();
  }

  void _timerNavigate() async {
    Future.delayed(const Duration(seconds: 4), () async {
      Get.offAll(() => const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.white,
      body: SafeArea(
        child: Container(
          color: ColorsConstants.white,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
          child: Center(
            child: Image.asset(
              "assets/images/images1.png",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
