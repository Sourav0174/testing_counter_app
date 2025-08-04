part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const COUNTER = _Paths.COUNTER;
  static const LISTVIEW = _Paths.LISTVIEW;
  static const USER_LIST = _Paths.USER_LIST;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const COUNTER = '/counter';
  static const LISTVIEW = '/listview';
  static const USER_LIST = '/user-list';
}
