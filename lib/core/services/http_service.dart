import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpService {
  HttpService();

  final _dio = Dio();

  final String _baseUrl = 'localhost:8080/v1/';

  Future<dynamic> getHttp({
    required String route,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        _baseUrl + route,
        options: Options(
          headers: headers,
          contentType: 'application/json',
        ),
      );
      return response.data;
    } on DioError catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  Future<dynamic> postHttp({
    required String route,
    dynamic body,
    Map<String, dynamic>? headers,
  }) async {
    Response<dynamic> response;
    try {
      response = await _dio.post(
        _baseUrl + route,
        data: body,
        options: Options(
          contentType: 'application/json',
          headers: headers,
        ),
      );

      return response.data;
    } on DioError catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
