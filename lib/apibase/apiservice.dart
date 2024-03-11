import 'package:dio/dio.dart';
import 'package:events_all/model/event_dm.dart';
import 'package:retrofit/retrofit.dart';

part 'apiservice.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService({required Dio dio, required String baseUrl}) {
    return _ApiService(dio, baseUrl: baseUrl);
  }

  @GET('{categories}.json')
  Future<EventDm> getEventList({
    @Path() required String categories,
  });
}
