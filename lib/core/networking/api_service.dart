import 'package:bookly_app/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiService{
  final _baseUrl = apiUrlLink;
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String,dynamic>> getRequest({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}