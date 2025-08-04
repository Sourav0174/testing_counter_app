import 'dart:ui';
import 'package:_1_counter_app/app/modules/user_list/views/user_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../counter/views/counter_view.dart';
import '../../listview/views/listview_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final List<Widget> pages = [UserListView(), ListviewView()];

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    233,
                    107,
                    107,
                  ).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  currentIndex: controller.selectedIndex.value,
                  onTap: controller.changeTabIndex,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white70,
                  selectedFontSize: 14.sp,
                  unselectedFontSize: 12.sp,
                  iconSize: 24.sp,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add),
                      label: 'Counter',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.list),
                      label: 'List',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
