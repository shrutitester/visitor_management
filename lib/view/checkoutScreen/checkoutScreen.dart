import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visitor_management/constants/stringConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';

import '../../constants/colorConstants.dart';
import 'checkoutItem.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final AddProductController _controller = Get.find();
  String afterDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  String date = DateFormat('dd-MMM-yyyy')
      .format(DateTime.now().subtract(const Duration(days: 30)));

  @override
  void initState() {
    checkout();
    super.initState();
  }

  void checkout() async {
    await _controller.getProfile(
        _controller.lstLogin[0].vID ?? '', '', date, afterDate, '', '',"");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.white,
          centerTitle: true,
          title: const Text(
            StringConstants.checkOut,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: ColorsConstants.white,
        body: controller.lstParty.isEmpty
            ? const Center(
                child: Text("No item"),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 10),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.lstParty.length,
                    itemBuilder: (context, index) {
                      return CheckoutItem(controller.lstParty[index]);
                    }),
              ),
      );
    });
  }
}
