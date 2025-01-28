import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget? child;
  const TextFieldContainer({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: child,
    );
  }
}