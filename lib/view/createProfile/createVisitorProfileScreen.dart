import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visitor_management/constants/colorConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/utils/lotsOfThemes.dart';
import 'package:visitor_management/view/login/loginScreen.dart';
import '../../commonWidget/roundButton.dart';
import '../../commonWidget/roundInputField.dart';
import '../../constants/stringConstants.dart';
import '../../constants/stylesConstants.dart';
import '../../constants/themeHelper.dart';
import '../../model/getVisitorModel.dart';
import '../../model/visitingTypeModel.dart';

class CreateProfileScreen extends StatefulWidget {
  CreateProfileScreen(this.phone, {super.key});
  String phone;
  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  String? type, name, email, phone, gender, address, company;
  LstParty? lstParty;
  VType? vType;
  XFile? pickedImage;
  File? image;
  File? images;
  final ImagePicker _picker = ImagePicker();
  String image64Id = '';
  String image64 = '';

  void openPicker(ImageSource source) async {
    Navigator.pop(context);
    pickedImage = await _picker.pickImage(
        source: source, imageQuality: 100, maxHeight: 600, maxWidth: 600);
    File file = File(pickedImage!.path);
    Uint8List imageBytes = await file.readAsBytes();
    String base64Image = base64.encode(imageBytes);
    setState(() {
      image = file;
    });
    image64Id = base64Image;
  }

  void openPickers(ImageSource source) async {
    Navigator.pop(context);
    pickedImage = await _picker.pickImage(
        source: source, imageQuality: 100, maxHeight: 600, maxWidth: 600);
    File file = File(pickedImage!.path);
    Uint8List imageBytes = await file.readAsBytes();
    String base64Image = base64.encode(imageBytes);
    setState(() {
      images = file;
    });
    image64 = base64Image;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Create Profile',
            style: LotOfThemes.heading1,
          ),
          backgroundColor: ColorsConstants.white,
        ),
        backgroundColor: ColorsConstants.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Form(
                key: _formKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  primary: true,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Full Name',
                          style: LotOfThemes.heading3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RoundedInputField(
                          controller: nameController,
                          hintText: "Enter your name",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          type: StringConstants.username,
                          maxLength: 24,
                          counterText: '',
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        const Text(
                          'Gender',
                          style: LotOfThemes.heading3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 42,
                          child: DropdownSearch<String>(
                            popupProps: PopupProps.dialog(
                              fit: FlexFit.loose,
                              dialogProps: DialogProps(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              showSearchBox: true,
                              searchFieldProps: TextFieldProps(
                                  decoration: ThemeHelper().textInputDecoration(
                                      StringConstants.selectIdType, 'Search')),
                            ),
                            items: const ['Female', 'Male'],
                            dropdownDecoratorProps: DropDownDecoratorProps(
                                textAlignVertical: TextAlignVertical.bottom,
                                baseStyle: const TextStyle(
                                    overflow: TextOverflow.visible),
                                textAlign: TextAlign.left,
                                dropdownSearchDecoration: InputDecoration(
                                    hintText: StringConstants.selectIdType,
                                    hintStyle: LotOfThemes.txt14primary,
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFF989898)),
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            onChanged: (value) {
                              gender = value;
                            },
                            validator: (String? value) {
                              if (value == null) {
                                return "Required field";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Mobile Number',
                          style: LotOfThemes.heading3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 11, horizontal: 8),
                          width: MediaQuery.of(context).size.width,
                          height: 42,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(widget.phone),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'E-mail Address',
                          style: LotOfThemes.heading3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RoundedInputField(
                          controller: emailController,
                          hintText: 'Enter your e-mail address',
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        const Text(
                          'Company Name',
                          style: LotOfThemes.heading3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RoundedInputField(
                          controller: companyNameController,
                          hintText: "Enter your company name",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          type: StringConstants.username,
                          onChanged: (value) {
                            company = value;
                          },
                        ),
                        const Text(
                          'Address',
                          style: LotOfThemes.heading3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RoundedInputField(
                          controller: addressController,
                          hintText: "Enter Address",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          type: StringConstants.username,
                          onChanged: (value) {
                            address = value;
                          },
                        ),
                        const Text(
                          'Chose Your Government ID',
                          style: LotOfThemes.heading3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 42,
                          child: DropdownSearch<VType>(
                            popupProps: PopupProps.dialog(
                              fit: FlexFit.loose,
                              dialogProps: DialogProps(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              showSearchBox: true,
                              searchFieldProps: TextFieldProps(
                                  decoration: ThemeHelper().textInputDecoration(
                                      StringConstants.selectIdType, 'Search')),
                            ),
                            items: controller.vIdType,
                            itemAsString: (VType v) => v.vTNAME ?? '',
                            dropdownDecoratorProps: DropDownDecoratorProps(
                                textAlignVertical: TextAlignVertical.bottom,
                                baseStyle: const TextStyle(
                                    overflow: TextOverflow.visible),
                                textAlign: TextAlign.left,
                                dropdownSearchDecoration: InputDecoration(
                                    hintText: StringConstants.selectIdType,
                                    hintStyle: LotOfThemes.txt14primary,
                                    border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Color(0xFF989898)),
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                            onChanged: (VType? value) {
                              setState(() {
                                vType = value;
                                type = vType?.vTID;
                              });
                            },
                            validator: (VType? value) {
                              if (value == null) {
                                return "Required field";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        image != null
                            ? InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Select Option',
                                                  style: AppStyles.boldText(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: ColorsConstants
                                                          .blackColor),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    openPicker(
                                                        ImageSource.camera);
                                                  },
                                                  child: Text(
                                                    'Take Photo',
                                                    style: AppStyles.boldText(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ColorsConstants
                                                            .primary),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    openPicker(
                                                        ImageSource.gallery);
                                                  },
                                                  child: Text(
                                                    'Choose From Gallery',
                                                    style: AppStyles.boldText(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ColorsConstants
                                                            .primary),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ));
                                },
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Image.file(image!),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Select Option',
                                                  style: AppStyles.boldText(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: ColorsConstants
                                                          .blackColor),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    openPicker(
                                                        ImageSource.camera);
                                                  },
                                                  child: Text(
                                                    'Take Photo',
                                                    style: AppStyles.boldText(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ColorsConstants
                                                            .blackColor),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    openPicker(
                                                        ImageSource.gallery);
                                                  },
                                                  child: Text(
                                                    'Choose From Gallery',
                                                    style: AppStyles.boldText(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ColorsConstants
                                                            .blackColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ));
                                },
                                child: Container(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE4E4E4),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: const Color(0xffE4E4E4),
                                      )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/Upload document.png'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text('Upload Document')
                                    ],
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Take Your Photo',
                          style: LotOfThemes.heading3,
                        ),
                        images != null
                            ? InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Select Option',
                                                  style: AppStyles.boldText(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: ColorsConstants
                                                          .blackColor),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    openPickers(
                                                        ImageSource.camera);
                                                  },
                                                  child: Text(
                                                    'Take Photo',
                                                    style: AppStyles.boldText(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ColorsConstants
                                                            .blackColor),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    openPickers(
                                                        ImageSource.gallery);
                                                  },
                                                  child: Text(
                                                    'Choose From Gallery',
                                                    style: AppStyles.boldText(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ColorsConstants
                                                            .blackColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ));
                                },
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Image.file(images!),
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Select Option',
                                                  style: AppStyles.boldText(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: ColorsConstants
                                                          .blackColor),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    openPickers(
                                                        ImageSource.camera);
                                                  },
                                                  child: Text(
                                                    'Take Photo',
                                                    style: AppStyles.boldText(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ColorsConstants
                                                            .blackColor),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    openPickers(
                                                        ImageSource.gallery);
                                                  },
                                                  child: Text(
                                                    'Choose From Gallery',
                                                    style: AppStyles.boldText(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: ColorsConstants
                                                            .blackColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ));
                                },
                                child: Container(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffE4E4E4),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: const Color(0xffE4E4E4),
                                      )),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/take photo.png'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text('Take Photo'),
                                    ],
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 12,
                        ),
                        RoundButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() == true) {
                              if (nameController.toString() == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text(StringConstants.username)));
                              } else if (phoneController.toString() == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            StringConstants.alertPhoneNo)));
                              } else if (companyNameController.toString() ==
                                  '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text(StringConstants.username)));
                              } else if (addressController.toString() == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text(StringConstants.username)));
                              } else {
                                Get.to(const LoginScreen());
                                await controller.getDetailSave(
                                  name ?? '',
                                  email ?? '',
                                  widget.phone,
                                  address ?? '',
                                  company ?? '',
                                  image64Id,
                                  type ?? '',
                                  image64,
                                  gender ?? '',
                                );
                                Get.showSnackbar(
                                  GetSnackBar(
                                    title: controller.msg ?? 'value',
                                    message: controller.status ?? 'qwerty',
                                    duration: const Duration(seconds: 4),
                                  ),
                                );
                              }
                            }
                          },
                          title: StringConstants.save,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
