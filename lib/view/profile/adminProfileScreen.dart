import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../commonWidget/roundButton.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstants.dart';
import '../../constants/stylesConstants.dart';
import '../../controller/addProductController.dart';
import '../../utils/lotsOfThemes.dart';
import '../login/loginScreen.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.white,
          title: const Text(
            'Profile',
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
                CircleAvatar(
                  radius: (50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      'http://${controller.lstAdmin[0].aIMG ?? ""}',
                      fit: BoxFit.contain,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
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
                              width: 130,
                              child: Text(
                                'Name :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.lstAdmin[0].aNAME ?? '',
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
                              width: 130,
                              child: Text(
                                'Gender :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.lstAdmin[0].aGENDER ?? '',
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
                              width: 130,
                              child: Text(
                                'Mobile Number :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.lstAdmin[0].aPHONE ?? '',
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
                              width: 130,
                              child: Text(
                                'E-mail Address :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.lstAdmin[0].aEMAIL ?? '',
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
                              width: 130,
                              child: Text(
                                'Company Name :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.lstAdmin[0].aCompanyNAME ?? '',
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
                              width: 130,
                              child: Text(
                                'ID Proof :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.lstAdmin[0].aIdTYPENAME ?? '',
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
                              width: 130,
                              child: Text(
                                'Department :',
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              controller.lstAdmin[0].aDepNAME ?? '',
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    StringConstants.areYouSureForLogOut,
                                    style: AppStyles.boldText(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsConstants.blackColor),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Get.offAll(const LoginScreen());
                                          },
                                          child:
                                              const Text(StringConstants.yes)),
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child:
                                              const Text(StringConstants.no)),
                                    ],
                                  )
                                ],
                              ),
                            ));
                  },
                  title: 'Log Out',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
