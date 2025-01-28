import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visitor_management/commonWidget/textFieldContainer.dart';
import '../constants/colorConstants.dart';
import '../constants/stringConstants.dart';
import '../utils/lotsOfThemes.dart';
import '../utils/upperCaseTextFormatter.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? isEnable;
  final bool? obscureText;
  final FocusNode? focusNode;
  final String? label;
  final IconData? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? type;
  final ValueChanged<String>? onChanged;
  String? saveValue;
  String? initialValue;
  List<TextInputFormatter>? inputFormatters;
  final keyboardType;
  final textInputAction;
  final maxLength;
  final maxLines;
  final counterText;

  RoundedInputField(
      {super.key,
      this.controller,
      this.hintText,
      this.inputFormatters,
      this.isEnable,
      this.obscureText,
      this.focusNode,
      this.label,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.suffix,
      this.onChanged,
      this.keyboardType,
      this.textInputAction,
      this.type,
      this.counterText,
      this.maxLength,
      this.maxLines,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Center(
        child: TextFormField(
          obscureText: type == StringConstants.password ? true : false,
          onChanged: onChanged,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          focusNode: focusNode,
          enabled: isEnable,
          maxLength: maxLength,
          maxLines: maxLines,
          initialValue: initialValue,
          inputFormatters: [UpperCaseTextFormatter()],
          cursorColor: ColorsConstants.lightBlack,
          style: LotOfThemes.txt14Dark,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              suffix: suffix,
              hintStyle: LotOfThemes.txt14primary,
              counterText: counterText,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 1.0,
                ),
              ),
              labelText: label,
              labelStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSans',
                  fontSize: 14),
              hintText: hintText),
          validator: (input) {
            return validate(input!);
          },
          onSaved: (input) => saveValue = input,
          controller: controller,
        ),
      ),
    );
  }

  validate(String input) {
    if (type == StringConstants.username) {
      return input.isNotEmpty ? null : StringConstants.username;
    }
    if (type == StringConstants.password) {
      return input.isNotEmpty ? null : StringConstants.password;
    }
    if (type == StringConstants.enterQty) {
      return input.isNotEmpty ? null : StringConstants.invalidQty;
    }
    if (type == StringConstants.packer) {
      return input.isNotEmpty ? null : StringConstants.enterPacker;
    }
    if (type == StringConstants.mobile) {
      return input.length == 10 ? null : StringConstants.invalidMobile;
    }
  }
}
