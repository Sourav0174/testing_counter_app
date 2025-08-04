import 'package:get/get.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/listview/bindings/listview_binding.dart';
import '../modules/listview/views/listview_view.dart';
import '../modules/user_list/bindings/user_list_binding.dart';
import '../modules/user_list/views/user_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: Routes.COUNTER,
      page: () => const CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: Routes.LISTVIEW,
      page: () => const ListviewView(),
      binding: ListviewBinding(),
    ),
    GetPage(
      name: Routes.USER_LIST,
      page: () => const UserListView(),
      binding: UserListBinding(),
    ),
  ];
}
