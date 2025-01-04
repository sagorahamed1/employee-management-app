import 'package:dio/dio.dart';

class GetDataProvider {
  final Dio dio;

  GetDataProvider({required this.dio});

  Future<Response> getDataProvider(String uri) async {
    try {
      final response = await dio.get(uri.toString());
      return response;
    } catch (error, stackTrace) {
      print("Error: $error\nStacktrace: $stackTrace");
      return Future.error(error);
    }
  }


  // POST Request
  Future<Response> postData(String uri, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(uri, data: data);
      return response;
    } catch (error, stackTrace) {
      print("POST Error: \$error\nStacktrace: \$stackTrace");
      return Future.error(error);
    }
  }

}