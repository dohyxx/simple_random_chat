import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';
import 'package:flutter/material.dart';

SizedBox sizedBox({double? height, double? width}) {
  return SizedBox(
    width: width,
    height: height,
  );
}

TextStyle defaultTextStyle({
  final double fontSize = 12,
  final Color color = const Color(0xff6D6A68),
  final fontWeight = FontWeight.w600,
  final fontHeight = 1.3,
  final fontFamily = AppText.textFont,
  final decoration = TextDecoration.none,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
    height: fontHeight,
    decoration: decoration,
  );
}

Widget lineBorder({
  double? width,
  double height = 0.5,
  double? radius,
  Color color = const Color(0xFFF2F3F5),
  double vertical = 0,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: vertical),
    child: Container(
      width: width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
          side: BorderSide(
            width: height,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: color,
          ),
        ),
      ),
    ),
  );
}

Widget containerBox({double height = 4, double width = 36}) {
  return Container(
    margin: EdgeInsets.only(top: 13, bottom: 15),
    height: height,
    width: width,
    decoration: BoxDecoration(color: const Color(0xffDBDBDB), borderRadius: BorderRadius.circular(2)),
  );
}
