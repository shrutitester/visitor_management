import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:visitor_management/constants/colorConstants.dart';
import '../../commonWidget/roundButton.dart';
import '../../constants/stringConstants.dart';
import '../../controller/addProductController.dart';
import '../../utils/dateFormat.dart';
import '../../utils/lotsOfThemes.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  final AddProductController _controller = Get.find();
  var getResult = StringConstants.scanQr;

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        getResult = qrCode;
        qr();
      });
    } on PlatformException {
      getResult = 'Failed to scan Qr Code';
    }
  }

  @override
  void initState() {
    scanQRCode();
    super.initState();
  }

  void qr() async {
    await _controller.getProfile('', '', '', '', "", getResult,"");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.white,
          title: const Text(
            'Visitor Profile',
            style: LotOfThemes.heading1,
          ),
          centerTitle: true,
        ),
        backgroundColor: ColorsConstants.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
            child: ListView(
              children: [
                controller.lstParty.isEmpty
                    ? const Center(
                        child: Text('No Item'),
                      )
                    : Column(
                        children: [
                          CircleAvatar(
                            radius: (50),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                'http://${controller.lstParty[0].vImg ?? ""}',
                                fit: BoxFit.contain,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.asset(
                                    "assets/images/user.png",
                                    fit: BoxFit.fill,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffE4E4E4),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Name :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].vNAME ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Gender :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].vGender ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Mobile Number :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].vPHONE ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'E-mail Address :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].vEMAIL ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Company Name :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].vCompanyNAME ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Status :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].vSTATUS ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'ID Proof :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].vTNAME ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Department :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].dEPNAME ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Concern Person Name :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].vMEETTO ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Purpose :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].vPURPOSE ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Reference Name :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].rEFNAME ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Reference Phone Number :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.lstParty[0].rEFNO ?? '',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 150,
                                        child: Text(
                                          'Check-in Date & Time :',
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        '${ConvertFormat.convertDTFormat('${controller.lstParty[0].visitDATE}')} ${controller.lstParty[0].visitINTIME}',
                                        style: const TextStyle(fontSize: 12),
                                      ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundButton(
                            onPressed: () async {
                              await controller.getOutTiming(
                                  controller.lstParty[0].vAPPROVALID ?? '',
                                  'IN');
                              Get.showSnackbar(
                                GetSnackBar(
                                  title: controller.outTiming ?? 'value',
                                  message: controller.outTiming ?? 'qwerty',
                                  duration: const Duration(seconds: 4),
                                ),
                              );
                            },
                            title: 'Confirm',
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
