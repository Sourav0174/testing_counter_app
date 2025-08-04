import 'dart:ui';

import 'package:_1_counter_app/app/utils/glassContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/listview_controller.dart';

class ListviewView extends GetView<ListviewController> {
  const ListviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withAlpha(50),
          elevation: 0,
          title: Text(
            "Posts",
            style: TextStyle(color: Colors.black87, fontSize: 20.sp),
          ),
          actions: [
            IconButton(
              icon: Icon(
                controller.isGrid.value ? Icons.list : Icons.grid_view,
                color: Colors.black87,
                size: 24.sp,
              ),
              onPressed: () {
                controller.toggleView();
              },
            ),
          ],
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pinkAccent.shade100, Colors.lightBlue.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child:
              controller.isGrid.value
                  ? GridView.builder(
                    padding: EdgeInsets.all(5.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0.1.w,
                      mainAxisSpacing: 0.1.h,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: controller.posts.length,
                    itemBuilder: (context, index) {
                      final post = controller.posts[index];
                      return GlassContainer(
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Expanded(
                                child: Text(
                                  post.body,
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                  : ListView.builder(
                    padding: EdgeInsets.all(12.w),
                    itemCount: controller.posts.length,
                    itemBuilder: (context, index) {
                      final post = controller.posts[index];
                      return GlassContainer(
                        child: Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                post.body,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        ),
      );
    });
  }
}
