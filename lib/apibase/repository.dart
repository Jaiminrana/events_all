import 'package:dio/dio.dart';
import 'package:events_all/apibase/apiservice.dart';
import 'package:events_all/apibase/header_intercepter.dart';
import 'package:events_all/apibase/server_error.dart';
import 'package:events_all/model/event_dm.dart';
import 'package:events_all/values/app_constant.dart';
import 'package:flutter/foundation.dart';

class Repository {
  Repository._();

  late ApiService _apiService;

  final logInterceptor = LogInterceptor(
    requestBody: !kReleaseMode,
    responseBody: !kReleaseMode,
    request: !kReleaseMode,
    requestHeader: !kReleaseMode,
    responseHeader: !kReleaseMode,
  );

  static final Repository instance = Repository._();

  void initialise() {
    final dio = Dio();

    dio.interceptors.add(
      HeaderInterceptor(),
    );

    _apiService = ApiService(
      dio: dio,
      baseUrl: AppConstant.baseUrl,
    );
  }

  Future<EventDm> getEventList({required String categories}) async {
    return _apiCall(
      request: () => _apiService.getEventList(
        categories: categories,
      ),
    );
  }

  Future<T> _apiCall<T>({required AsyncValueGetter<T> request}) async {
    try {
      final response = await request();
      return response;
    } on DioException catch (error) {
      throw ServerError.fromDioException(exception: error);
    }
  }
}
