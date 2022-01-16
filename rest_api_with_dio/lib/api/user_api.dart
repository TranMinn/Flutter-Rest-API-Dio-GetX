import 'package:dio/dio.dart';

Future<Response> fetchAList(Dio dio, int page) {
  return dio.get('/api/users?page=$page');
}

Future<Response> fetchOne(Dio dio, String userId) {
  return dio.get('/api/users/$userId');
}

Future<Response> createOne(Dio dio, Map<String, dynamic> data) {
  return dio.post('/api/users', data: data);
}

Future<Response> updateOne(Dio dio, String userId, Map<String, dynamic> data) {
  return dio.put('/api/users/$userId', data: data);
}

Future<Response> deleteOne(Dio dio, String userId) {
  return dio.delete('/api/users/$userId');
}
