// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo/product/general/service/project_dio.dart';
import 'package:demo/product/network_work_screen/model/post_model.dart';
import 'package:demo/product/network_work_screen/service/post_service.dart';
import 'package:flutter/material.dart';

class PostViewModel extends ChangeNotifier {
  List<PostModel>? liste;
  bool isLoading = false;
  final IPostService _postService = PostService(DioManager.dio);

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchData() async {
    changeLoading();
    await _postService.getData().then((value) {
      liste = value;
    });
    changeLoading();
    notifyListeners();
  }
}
