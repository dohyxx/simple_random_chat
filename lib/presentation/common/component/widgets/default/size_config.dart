import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double screenTop = 0;
  static double screenBottom = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;
  static double _safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;
  static double safeBlockHorizontal = 0;
  static double safeBlockVertical = 0;
  static double safeWidth = 0;
  static double safeHeight = 0;
  static double scaleFactorHeight = 0;
  static double scaleFactorWidth = 0;

  static double sizeByWidth(double size) {
    return (size / 3.6) * blockSizeHorizontal;
  }

  static double sizeByHeight(double size) {
    return (size / 6.4) * blockSizeVertical;
  }

  static double getScaledSizeWidth(double size) {
    return (size * scaleFactorWidth);
  }

  static double getScaledSizeHeight(double size) {
    return (size * scaleFactorHeight);
  }

  static bool isTablet() {
    return screenHeight > 600 && screenWidth > 600;
  }

  Future<void> init(BuildContext context) async {
    _mediaQueryData = MediaQuery.of(context);
    if (_mediaQueryData!.size.width > 0) {
      screenWidth = _mediaQueryData!.size.width;
      screenHeight = _mediaQueryData!.size.height;
      screenTop = _mediaQueryData!.padding.top;
      screenBottom = _mediaQueryData!.padding.bottom;
      blockSizeHorizontal = screenWidth / 100;
      blockSizeVertical = screenHeight / 100;
      _safeAreaHorizontal = _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      _safeAreaVertical = _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
      safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
      double safeAreaWidth = _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      double safeAreaHeight = _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeWidth = (screenWidth - safeAreaWidth);
      safeHeight = (screenHeight - safeAreaHeight);
      scaleFactorHeight = (safeHeight / 640);
      if (scaleFactorHeight < 1) {
        double diff = (1 - scaleFactorHeight) * (1 - scaleFactorHeight);
        scaleFactorHeight += diff;
      }
      scaleFactorWidth = safeWidth / 360;
      if (scaleFactorWidth < 1) {
        double diff = (1 - scaleFactorWidth) * (1 - scaleFactorWidth);
        scaleFactorWidth += diff;
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 100));

      if (context.mounted) {
        return await init(context);
      }
    }
  }
}
