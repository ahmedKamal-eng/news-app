import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio; //write static to use it in init which it a static method

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> get(
      {@required String url, @required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
