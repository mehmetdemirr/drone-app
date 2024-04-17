import 'dart:io';

import 'package:demo/core/function/print_function.dart';
import 'package:demo/core/utilty/api_items.dart';
import 'package:demo/product/network_work_screen/model/post_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class IPostService {
  IPostService(this.dio);
  final Dio dio;
  Future<List<PostModel>?> getData();
}

class PostService extends IPostService {
  PostService(super.dio);

  @override
  Future<List<PostModel>?> getData() async {
    dio.interceptors.add(PrettyDioLogger());
    final result = await dio.get(ApiItem.posts.str());
    if (result.statusCode == HttpStatus.ok) {
      var jsonBody = result.data;
      if (jsonBody is List) {
        List<PostModel>? list =
            jsonBody.map((json) => PostModel.fromJson(json)).toList();
        printf("${list.length} veri geldi");
        return list;
      }
    }
    return null;
  }
}
