import 'package:dio/dio.dart';
import 'package:my_trip_planner_app/constant/apiRoutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkService {
  static Future getAllMyBookmark() async {
    try {
      Dio dio = Dio();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      Response res = await dio.get(APIRoute.myBookmark);
      return res.data;
    } catch (e) {
      return [];
    }
  }

  static Future addBookmark(
    String userId,
    String destinationId,
    String attractionId,
  ) async {
    try {
      Dio dio = Dio();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      Response res = await dio.post(APIRoute.addBookmark, data: {
        'user_id': userId,
        'destination_id': destinationId,
        'attraction_id': attractionId,
        'isDestination': true
      });
      return res;
    } catch (e) {
      return [];
    }
  }

  static Future removeBookmark(
    String destinationId,
  ) async {
    try {
      Dio dio = Dio();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      Response res = await dio.post(APIRoute.removeBookmark, data: {
        '_id': destinationId,
      });
      return res;
    } catch (e) {
      return [];
    }
  }

  static Future removeAttraction(
      String destinationId, String attractionId) async {
    try {
      Dio dio = Dio();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      Response res = await dio.post(APIRoute.removeAttraction,
          data: {'destinationId': destinationId, 'attractionId': attractionId});
      return res;
    } catch (e) {
      return [];
    }
  }

  static Future addAttraction(String destinationId, String attractionId) async {
    try {
      Dio dio = Dio();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      Response res = await dio.post(APIRoute.addAttraction,
          data: {'destinationId': destinationId, 'attractionId': attractionId});
      return res;
    } catch (e) {
      return [];
    }
  }
}
