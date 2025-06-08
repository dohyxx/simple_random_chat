import 'package:simple_random_chat/presentation/common/component/utils/data_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultClick extends StatelessWidget {
  final Function onTap;
  final Widget child;

  const DefaultClick({required this.onTap, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DataUtil.throttle(() => onTap());
      },
      child: child,
    );
  }
}

class DefaultBlinkButton extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final double minSize;

  const DefaultBlinkButton({
    required this.onTap,
    required this.child,
    this.minSize = 30,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        DataUtil.throttle(() => onTap(), duration: Duration(milliseconds: 200));
      },
      minSize: minSize,
      padding: EdgeInsets.zero,
      child: child,
    );
  }
}
