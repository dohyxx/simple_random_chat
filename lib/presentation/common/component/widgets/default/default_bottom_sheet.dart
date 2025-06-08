import 'package:simple_random_chat/presentation/common/app_router/app_router.dart';
import 'package:flutter/material.dart';

Future defaultBottomSheet({
  required Widget child,
  bool isDismissible = true,
  bool enableDrag = true,
  double? maxHeight,
  Color backgroundColor = const Color(0xffffffff),
  VoidCallback? callBack,
}) async {
  final context = GlobalNavigator.key.currentContext!;

  return await showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    isDismissible: isDismissible,
    constraints: BoxConstraints(maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.9),
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius:
                const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: child,
      );
    },
  ).then((value) {
    if (value == true && callBack != null) {
      callBack();
    }
    return value;
  });
}
