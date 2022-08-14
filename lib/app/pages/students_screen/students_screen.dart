import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_driver/app/pages/students_screen/students_controller.dart';
import 'package:school_driver/app/theme/app_colors.dart';
import 'package:school_driver/main.dart';

class StudentsScreen extends StatelessWidget {
  final StudentsScreenController _screenController =
      Get.find<StudentsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _screenController.scrollController,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.SECONDARY_COLOR,
            pinned: true,
            automaticallyImplyLeading: false,
            toolbarHeight: 110.h,
            expandedHeight: 230.h,
            flexibleSpace: SafeArea(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(18.0.sp),
                      child: Icon(size: 25.sp, color: Colors.white, Icons.menu),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Obx(
                              () => AnimatedOpacity(
                                duration: const Duration(milliseconds: 100),
                                opacity: _screenController.opacity.value,
                                child: Image.asset('assets/images/1.jpg'),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: 18.0.sp, left: 18.0.sp),
                            child: SizedBox(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 10.sp, bottom: 10.sp),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: const Icon(Icons.search_outlined),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(500.sp),
                                  ),
                                  hintText: 'search_students'.tr,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverAnimatedList(
            initialItemCount: 50,
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: buildCardStudent(context: context),
              );
            },
          )
        ],
      ),
    );
  }

  Widget buildCardStudent({required BuildContext context}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      margin: EdgeInsets.only(top: 5.h, right: 20.w, left: 20.w),
      child: SizedBox(
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1500.0.sp),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 18.0.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildImage(),
                Text('data'),
                Text('data'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage() {
    return Container(

      width: 59.sp,
      height: 59.sp,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(250.sp),
      ),
      child: Center(
        child: Container(
          width: 54.sp,
          height: 54.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(250.sp),
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('assets/images/1.jpg'), fit: BoxFit.cover)),
          // child: Image.asset('assets/images/1.jpg' ,fit: BoxFit.cover),
        ),
      ),
    );
  }
}
