import 'package:flutter/material.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_button_event.dart';

class FeatureButtonWidget extends StatelessWidget {
  final String title;
  final String icon;
  final double height;
  final Function onTap;

  const FeatureButtonWidget({
    required this.title,
    required this.icon,
    required this.onTap,
    this.height = 130,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultBlinkButton(
        onTap: () => onTap(),
        child: Container(
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffF4EDE5).withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xff222222).withValues(alpha: 0.3), width: 0.2),
            boxShadow: [
              BoxShadow(
                color: Color(0xff222222).withValues(alpha: 0.1),
                blurRadius: 5,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: AppTextBox(title, 22, Color(0xff222222), fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
