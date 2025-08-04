import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../data/models/post_model.dart';

class ListviewController extends GetxController {
  var isLoading = true.obs;
  var posts = <PostModel>[].obs;
  var isGridView = false.obs; // 🔄 Toggle for GridView/ListView
  final Dio _dio = Dio();

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  var isGrid = false.obs;

  void toggleView() {
    isGrid.value = !isGrid.value;
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);

      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        posts.value =
            response.data
                .map<PostModel>((json) => PostModel.fromJson(json))
                .toList();
      } else {
        Get.snackbar(
          "Error",
          "Something went wrong while fetching posts",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar("Error fetching posts", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
