import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:_1_counter_app/app/data/models/user_model.dart';

class UserListController extends GetxController {
  var isLoading = true.obs;
  var userList = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=1'),
        headers: {"x-api-key": "reqres-free-v1"},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> users = data['data'] ?? [];

        userList.value = users.map((json) => User.fromJson(json)).toList();
      } else {
        Get.snackbar(
          "Error",
          "Failed to load users (status code: ${response.statusCode})",
        );
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load users: $e");
    } finally {
      isLoading(false);
    }
  }
}
