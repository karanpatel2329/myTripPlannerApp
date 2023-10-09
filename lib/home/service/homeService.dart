import 'package:dio/dio.dart';
import 'package:my_trip_planner_app/constant/apiRoutes.dart';

class HomeService {
  static Future getDestination() async {
    try {
      Dio dio = Dio();
      Response res = await dio.get(APIRoute.getDestination);
      if (res.statusCode == 200) {
        return res.data;
      }
    } catch (e) {
      return [];
    }
  }
}
