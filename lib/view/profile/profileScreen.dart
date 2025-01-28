import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/view/login/loginScreen.dart';
import '../../commonWidget/roundButton.dart';
import '../../constants/colorConstants.dart';
import '../../constants/stringConstants.dart';
import '../../constants/stylesConstants.dart';
import '../../utils/lotsOfThemes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AddProductController _controller = Get.find();
  XFile? pickedImage;
  File? images;
  String image64 = '';
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    profile();
    super.initState();
  }

  void profile() async {
    await _controller.getProfile(
        _controller.lstLogin[0].vID ?? '', '', '', '', "", "","");
  }

  void openPickers(ImageSource source) async {
    Navigator.pop(context);
    pickedImage = await _picker.pickImage(
        source: source, imageQuality: 100, maxHeight: 600, maxWidth: 600);
    File file = File(pickedImage!.path);
    Uint8List imageBytes = await file.readAsBytes();
    String base64Image = base64.encode(imageBytes);
    images = file;
    image64 = base64Image;
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
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: (50),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'http://${controller.img ?? ""}',
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
                                controller.name ?? '',
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
                                controller.gender ?? '',
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
                                controller.phone ?? '',
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
                                controller.email ?? '',
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
                                controller.purpose ?? '',
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
                                  'Address :',
                                  style: TextStyle(fontSize: 11),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                controller.address ?? '',
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
                                controller.visitorType ?? '',
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
                                            child: const Text(
                                                StringConstants.yes)),
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
        ),
      );
    });
  }
}
