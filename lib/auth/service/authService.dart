import 'package:dio/dio.dart';
import 'package:my_trip_planner_app/constant/APIRoutes.dart';

class AuthService {
  static Future login(String email, String password) async {
    try {
      Dio dio = Dio();
      Response res = await dio.post('${APIRoute.baseURL}/user/login',
          data: {"email": email, "password": password});
      return res.data;
    } catch (e) {}
  }

  static Future register(String name, String email, String password) async {
    try {
      Dio dio = Dio();
      Response res = await dio.post('${APIRoute.baseURL}/user/register',
          data: {"name": name, "email": email, "password": password});
      return res.data;
    } catch (e) {}
  }
}
