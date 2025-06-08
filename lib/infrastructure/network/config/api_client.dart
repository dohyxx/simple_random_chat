import 'package:dio/dio.dart';
import 'package:simple_random_chat/infrastructure/network/config/result.dart';
import 'package:simple_random_chat/presentation/common/component/widgets/logger/logger.dart';

class ApiClient {
  static Future<Result<T>> call<T>(Future<T> Function() request) async {
    try {
      T data = await request();
      return Success(data);

      /// Dio Error
    } on DioException catch (dioError) {
      Log.d('[DioException] $request => $dioError');
      return Failure(Exception(dioError));
    }

    /// Client Error
    catch (e) {
      Log.d('$request => $e');
      return Failure(Exception(e));
    }
  }
}
