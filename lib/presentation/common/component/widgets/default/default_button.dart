import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double borderRadius;
  final double borderSide;

  const DefaultButton({
    required this.text,
    required this.backgroundColor,
    this.padding = EdgeInsets.zero,
    this.textColor = Colors.white,
    this.borderRadius = 10,
    this.borderSide = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 56,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: borderSide, color: const Color(0xFFEBEBED)),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextBox(text, 18, textColor, fontWeight: FontWeight.w700),
          ],
        ),
      ),
    );
  }
}
