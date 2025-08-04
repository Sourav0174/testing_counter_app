import 'package:_1_counter_app/app/modules/user_list/controllers/user_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "GetX Counter App",
          theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 105, 155),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.pinkAccent.withOpacity(0.2),
              elevation: 0,
            ),
          ),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
