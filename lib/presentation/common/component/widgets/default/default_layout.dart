import 'dart:io';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final EdgeInsets edgeInsets;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const DefaultLayout({
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.edgeInsets = const EdgeInsets.symmetric(horizontal: 0),
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.resizeToAvoidBottomInset = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // canPop: Platform.isIOS ? false : true,
      canPop: true,
      onPopInvokedWithResult: (didPop, result) async {
        //
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          backgroundColor: backgroundColor,
          appBar: appBar,
          body: Padding(padding: edgeInsets, child: body),
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
        ),
      ),
    );
  }
}
