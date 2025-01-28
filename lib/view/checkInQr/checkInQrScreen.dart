import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:visitor_management/constants/stringConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/view/visitor_tabview/visitor_tabview.dart';

import '../../constants/colorConstants.dart';

class CheckInQrScreen extends StatefulWidget {
  CheckInQrScreen(this.id, {super.key});
  String id;
  @override
  State<CheckInQrScreen> createState() => _CheckInQrScreenState();
}

class _CheckInQrScreenState extends State<CheckInQrScreen> {
  String data = "Hello, QR Code!";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.white,
          centerTitle: true,
          title: const Text(
            StringConstants.checkIn,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {
              Get.off(const VisitorTabview());
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        backgroundColor: ColorsConstants.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImageView(
                data: widget.id,
                version: QrVersions.min,
                size: 250.0,
              ),
              const SizedBox(height: 20.0),
              Text(
                "Check in Id: ${widget.id}",
                style: const TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ),
      );
    });
  }
}
