import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';
import 'package:flutter/material.dart';

class AppTextBox extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final int maxLines;
  final double fontHeight;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final TextDecoration decoration;

  const AppTextBox(
    this.text,
    this.fontSize,
    this.color, {
    this.fontWeight = FontWeight.w600,
    this.maxLines = 10,
    this.fontHeight = 1.3,
    this.textAlign = TextAlign.start,
    this.textOverflow = TextOverflow.ellipsis,
    this.decoration = TextDecoration.none,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: AppText.textFont,
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        height: fontHeight,
        decoration: decoration,
        decorationColor: color,
      ),
    );
  }
}
