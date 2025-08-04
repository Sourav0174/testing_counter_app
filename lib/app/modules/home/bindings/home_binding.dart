import 'package:get/get.dart';
import '../../counter/controllers/counter_controller.dart';
import '../../listview/controllers/listview_controller.dart'; // Add this
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CounterController>(() => CounterController());
    Get.lazyPut<ListviewController>(() => ListviewController()); // Add this
  }
}
