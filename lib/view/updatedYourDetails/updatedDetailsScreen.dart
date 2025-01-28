import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visitor_management/constants/colorConstants.dart';
import 'package:visitor_management/controller/addProductController.dart';
import 'package:visitor_management/constants/stringConstants.dart';
import '../../commonWidget/roundButton.dart';
import '../../commonWidget/roundInputField.dart';
import '../../constants/themeHelper.dart';
import '../../model/getVisitorModel.dart';
import '../../model/visitingTypeModel.dart';
import '../../utils/lotsOfThemes.dart';
import '../profile/profileScreen.dart';

class UpdatedDetailsScreen extends StatefulWidget {
  LstParty? lstParty;
  UpdatedDetailsScreen(this.lstParty, {super.key});

  @override
  State<UpdatedDetailsScreen> createState() => _UpdatedDetailsScreenState();
}

class _UpdatedDetailsScreenState extends State<UpdatedDetailsScreen> {
  final AddProductController _controller = Get.find();
  final _formKey = GlobalKey<FormState>();
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
  void initState() {
    super.initState();
    getUpdateDetails();
  }

  void getUpdateDetails() async {
    setState(() {
      type = widget.lstParty?.vIDType;
      name = widget.lstParty?.vNAME;
      email = _controller.lstParty[0].vEMAIL;
      gender = _controller.lstParty[0].vGender;
      address = _controller.lstParty[0].vADDRESS;
      company = _controller.lstParty[0].vCompanyNAME;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConstants.white,
          centerTitle: true,
          title: const Text(
            StringConstants.updateYourDetails,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: ColorsConstants.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Form(
                key: _formKey,
                child: Column(
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
                      initialValue: widget.lstParty?.vNAME,
                      hintText: "Enter your name",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      type: StringConstants.username,
                      maxLength: 24,
                      counterText: '',
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
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
                        selectedItem: widget.lstParty?.vGender,
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
                            baseStyle:
                                const TextStyle(overflow: TextOverflow.visible),
                            textAlign: TextAlign.left,
                            dropdownSearchDecoration: InputDecoration(
                                hintText: StringConstants.selectIdType,
                                hintStyle: LotOfThemes.txt14primary,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFF989898)),
                                    borderRadius: BorderRadius.circular(10)))),
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
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
                      child: Text(widget.lstParty?.vPHONE ?? ''),
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
                      initialValue: widget.lstParty?.vEMAIL,
                      hintText: 'Enter your e-mail address',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
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
                      initialValue: widget.lstParty?.vCompanyNAME,
                      hintText: "Enter your company name",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      type: StringConstants.username,
                      onChanged: (value) {
                        setState(() {
                          company = value;
                        });
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
                      initialValue: widget.lstParty?.vADDRESS,
                      hintText: "Enter Address",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      type: StringConstants.username,
                      onChanged: (value) {
                        setState(() {
                          address = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RoundButton(
                        onPressed: () async {
                          await controller.getUpdateDetail(
                              name ?? '',
                              email ?? '',
                              widget.lstParty?.vPHONE ?? '',
                              address ?? '',
                              company ?? '',
                              gender ?? '',
                              widget.lstParty?.vID ?? '');
                          Get.to(const ProfileScreen());
                        },
                        title: StringConstants.save)
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
