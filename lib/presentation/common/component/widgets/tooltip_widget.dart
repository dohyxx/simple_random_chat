import 'package:flutter/material.dart';

class TooltipWidget extends StatelessWidget {
  final Widget text;
  final double borderRadius;
  const TooltipWidget({
    required this.text,
    this.borderRadius = 20,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 247,
          decoration: BoxDecoration(
            color: Color(0xffF4EDE5),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(child: text),
        ),
        ClipPath(
          clipper: _TriangleClipper(),
          child: Container(
            width: 20,
            height: 12,
            color: Color(0xffF4EDE5),
          ),
        ),
      ],
    );
  }
}

class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
  }

  @override
  bool shouldReclip(_) => false;
}
