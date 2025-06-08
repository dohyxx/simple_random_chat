import 'package:logger/logger.dart';

class Log {
  static Logger? _logger;

  static voidInit() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        colors: false,
      ),
    );
  }

  /// DEBUG
  static d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.d(message);
  }

  /// INFO
  static i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.i(message);
  }

  /// WARNING
  static w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.w('WARNING: $message');
  }

  /// ERROR
  static e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.e('ERROR: $message');
  }
}
