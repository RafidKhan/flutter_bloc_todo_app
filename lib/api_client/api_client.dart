import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio();

  Future<Response> getRequest({required String url}) async {
    try {
      final response = await dio.get(url);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
