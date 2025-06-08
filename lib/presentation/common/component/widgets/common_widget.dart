import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:flutter/cupertino.dart';

Widget tipIcon({
  EdgeInsets edgeInsets = const EdgeInsets.only(bottom: 12),
}) {
  return Padding(
    padding: edgeInsets,
    child: Container(
      height: 26,
      width: 41,
      decoration: BoxDecoration(
        color: Color(0xffFFD8E1),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Center(child: AppTextBox('TIP', 12, Color(0xff403D3C), fontWeight: FontWeight.w700)),
    ),
  );
}
