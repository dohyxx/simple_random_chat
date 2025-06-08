import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_random_chat/presentation/common/app_router/app_router.dart';
import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/app_text_box.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/default/default_widget.dart';

class Util {
  static void alert(
    String content, {
    String okButtonName = AppText.confirm,
    double size = 16,
    void Function()? onClick,
    void Function()? onClickCancel,
    Color buttonBackgroundColor = const Color(0xff403D3C),
    Color buttonTextColor = const Color(0xFFFFFFFF),
    FontWeight fontWeight = FontWeight.w700,
    bool isCancelButton = false,
  }) {
    final context = GlobalNavigator.key.currentContext!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(50),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 16),
          child: Wrap(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextBox(
                    content,
                    16,
                    const Color(0xff222222),
                    fontWeight: fontWeight,
                    textAlign: TextAlign.center,
                    fontHeight: 1.3,
                  ),
                  Row(
                    children: [
                      /// 취소 버튼
                      if (isCancelButton)
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              /// ShellRoute Page > GoRouter.pop() 사용 X
                              Navigator.of(context, rootNavigator: true).pop();

                              if (onClickCancel != null) {
                                onClickCancel();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Container(
                                margin: const EdgeInsets.only(top: 26),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFF5F6F8),
                                ),
                                alignment: Alignment.center,
                                child: AppTextBox(
                                  AppText.cancel,
                                  16,
                                  Color(0xff222222),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                      Expanded(
                        child: InkWell(
                          onTap: () {
                            /// ShellRoute Page > GoRouter.pop() 사용 X
                            Navigator.of(context, rootNavigator: true).pop();

                            if (onClick != null) {
                              onClick();
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 26),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: buttonBackgroundColor,
                            ),
                            alignment: Alignment.center,
                            child: AppTextBox(
                              okButtonName,
                              16,
                              buttonTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget highlightText(String fullText, String highlight) {
    final startIndex = fullText.indexOf(highlight);

    if (startIndex == -1) {
      return Text(fullText, style: defaultTextStyle());
    }

    final before = fullText.substring(0, startIndex);
    final highlighted = fullText.substring(startIndex, startIndex + highlight.length);
    final after = fullText.substring(startIndex + highlight.length);

    return RichText(
      text: TextSpan(
        style: defaultTextStyle(),
        children: [
          TextSpan(text: before, style: defaultTextStyle()),
          TextSpan(text: highlighted, style: defaultTextStyle(fontWeight: FontWeight.w700)),
          TextSpan(text: after, style: defaultTextStyle()),
        ],
      ),
    );
  }

  /// Chat DateTime
  static String formatChatTime(DateTime dateTime) {
    final now = DateTime.now();

    // 오늘 날짜 기준으로 비교
    final isToday = now.year == dateTime.year && now.month == dateTime.month && now.day == dateTime.day;

    if (isToday) {
      return DateFormat('HH:mm').format(dateTime);
    } else {
      return DateFormat('MM.dd').format(dateTime);
    }
  }
}
