import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8000',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Map<String, dynamic>> parseTask(String text) async {
    final res = await dio.post('/chat/parse', data: {'text': text});
    return res.data;
  }

  Future<void> confirmTask(Map<String, dynamic> payload) async {
    await dio.post('/tasks/confirm', data: payload);
  }
}

final apiClient = ApiClient();
