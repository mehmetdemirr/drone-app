import 'package:dio/dio.dart';

mixin class DioManager {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"),
  );
}
