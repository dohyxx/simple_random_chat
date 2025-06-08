import 'package:flutter/material.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/tooltip_widget.dart';

import 'default/default_button_event.dart';

class TooltipWithButton extends StatelessWidget {
  final String tooltipMessage;
  final String buttonName;
  final void Function() onTap;
  final bool isSelected;

  const TooltipWithButton({
    required this.tooltipMessage,
    required this.buttonName,
    required this.onTap,
    this.isSelected = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 10),
            child: Center(
              child: TooltipWidget(
                borderRadius: 13,
                text: Padding(
                  padding: const EdgeInsets.all(12),
                  child: AppTextBox(
                    tooltipMessage,
                    14,
                    Color(0xff6D6A68),
                    fontWeight: FontWeight.w800,
                    fontHeight: 1.4,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          DefaultBlinkButton(
            onTap: () => onTap(),
            child: Container(
              height: 121,
              decoration: BoxDecoration(
                  color: isSelected ? Color(0xff403D3C) : Color(0xff403D3C).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(3)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: AppTextBox(buttonName, 20, Color(0xffFFFFFF), fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
