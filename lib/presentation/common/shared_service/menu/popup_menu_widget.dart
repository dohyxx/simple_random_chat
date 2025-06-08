import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

final popupMenuProvider = StateProvider.autoDispose((_) => false);

class CustomPopupMenu extends ConsumerStatefulWidget {
  final List<MenuItem> items;

  const CustomPopupMenu({
    super.key,
    required this.items,
  });

  @override
  ConsumerState<CustomPopupMenu> createState() => _CustomPopupMenuState();
}

class _CustomPopupMenuState extends ConsumerState<CustomPopupMenu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF).withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Color(0xff403D3C).withValues(alpha: 0.3), width: 0.2),
          boxShadow: [
            BoxShadow(
              color: Color(0xff6D6A68).withValues(alpha: 0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widget.items.map((item) {
            return GestureDetector(
              onTap: () {
                ref.read(popupMenuProvider.notifier).state = false;

                item.onSelected();
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SvgPicture.asset(item.icon),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class MenuItem {
  final String icon;
  final void Function() onSelected;

  MenuItem({
    required this.icon,
    required this.onSelected,
  });
}
