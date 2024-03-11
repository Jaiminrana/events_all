import 'package:dio/dio.dart';
import 'package:events_all/generated/l10n.dart';

class ServerError implements Exception {
  ServerError.fromDioException({required DioException exception}) {
    _handleError(exception);
  }

  ServerError.fromException(Object error) {
    errorMessage = error.toString();
  }

  late final String? errorMessage;
  late final int? errorCode;

  void _handleError(DioException exception) {
    final response = exception.response;
    errorCode = response?.statusCode;
    final data = exception.response?.data?.toString();
    if (data != null) {
      errorMessage = data;
    } else if (response == null) {
      errorMessage = Str.current.oopsSomethingWentWrong;
    } else {
      errorMessage = exception.message ?? Str.current.somethingWentWrong;
    }
  }
}
