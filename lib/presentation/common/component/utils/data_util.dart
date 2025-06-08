import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:simple_random_chat/presentation/common/component/const/app_text.dart';

class DataUtil {
  ///debounce
  static void debounce(Function callback, {Duration? duration}) {
    EasyDebounce.debounce(
      AppText.projectName,
      duration ?? const Duration(milliseconds: 500),
      () => callback(),
    );
  }

  ///throttle
  static void throttle(Function callback, {Duration? duration}) {
    EasyThrottle.throttle(
      AppText.projectName,
      duration ?? const Duration(milliseconds: 500),
      () => callback(),
    );
  }
}
