import 'package:flutter/material.dart';
import 'package:visitor_management/constants/colorConstants.dart';

enum RoundButtonType { bgPrimary, textPrimary }

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback? onDoubleTap;
  final String title;
  final RoundButtonType type;
  final double fontSize;
  final double height;
  const RoundButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.onDoubleTap,
      this.fontSize = 16,
      this.height = 42,
      this.type = RoundButtonType.bgPrimary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onDoubleTap: onDoubleTap,
        onTap: onPressed,
        child: Container(
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: type == RoundButtonType.bgPrimary
                ? null
                : Border.all(color: ColorsConstants.primary, width: 1),
            color: type == RoundButtonType.bgPrimary
                ? ColorsConstants.primary
                : ColorsConstants.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: TextStyle(
                color: type == RoundButtonType.bgPrimary
                    ? ColorsConstants.white
                    : ColorsConstants.primary,
                fontSize: fontSize,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
