import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/data/models/students_model.dart';
import 'package:school_driver/app/pages/components/avatar_component.dart';
import 'package:school_driver/app/pages/components/drawer/drawer_component.dart';
import 'package:school_driver/app/pages/components/drawer/drawer_icon_component.dart';
import 'package:school_driver/app/pages/students_screen/componnetns/students_progress.dart';
import 'package:school_driver/app/pages/students_screen/students_controller.dart';
import 'package:school_driver/app/route/routs.dart';
import 'package:school_driver/app/theme/app_colors.dart';

class StudentsScreen extends StatelessWidget {
  final StudentsScreenController _screenController =
      Get.find<StudentsScreenController>();
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DrawerComponent(
        child: CustomScrollView(
          controller: _screenController.scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: (_authController.time.value == "pm")
                  ? AppColors.PRIMARY_COLOR
                  : AppColors.SECONDARY_COLOR,
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
                        child: DrawerIconComponent(),
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
                                () => Hero(
                                  transitionOnUserGestures: true,
                                  tag: (Get.find<AuthController>().time.value ==
                                          "pm")
                                      ? "evening"
                                      : "morning",
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 100),
                                    opacity: _screenController.opacity.value,
                                    child: Image.asset('assets/images/1.jpg'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 18.0.sp, left: 18.0.sp),
                              child: SizedBox(
                                child: TextField(
                                  onEditingComplete: () {
                                    _screenController.getStudents();
                                  },
                                  controller:
                                      _screenController.searchController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        top: 10.sp, bottom: 10.sp),
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon:
                                        const Icon(Icons.search_outlined),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(500.sp),
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
            Obx(
              () => (_screenController.isLoadStudents.value)
                  ? const StudentsProgressList()
                  : (_screenController.students.isNotEmpty)
                      ? SliverAnimatedList(
                          key: _screenController.listKye,
                          initialItemCount: _screenController.students.length,
                          itemBuilder: (BuildContext context, int index,
                              Animation<double> animation) {
                            return ScaleTransition(
                              filterQuality: FilterQuality.high,
                              scale: animation,
                              child: buildCardStudent(
                                  context: context,
                                  student: _screenController.students[index]),
                            );
                          },
                        )
                      : SliverAnimatedList(
                          initialItemCount: 1,
                          itemBuilder: (BuildContext context, int index,
                              Animation<double> animation) {
                            return ScaleTransition(
                              filterQuality: FilterQuality.high,
                              scale: animation,
                              child: SizedBox(
                                height: 300.h,
                                child: Center(
                                  child: Text('no_data'.tr),
                                ),
                              ),
                            );
                          },
                        ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCardStudent(
      {required BuildContext context, required StudentsModel student}) {
    return InkWell(
      onTap: () =>
          Get.toNamed(AppRouters.SHOW_STUDENT, arguments: {"student": student}),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60.h,
        margin: EdgeInsets.only(top: 5.h, right: 20.w, left: 20.w),
        child: SizedBox(
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1500.0.sp),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: Get.locale!.languageCode == "ar" ? 0 : null,
                  left: Get.locale!.languageCode == "en" ? 0 : null,
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: student.address!,
                    child: AvatarComponent(
                      bgColor: AppColors.DARK_COLOR,
                      radius: 25.8.h,
                      widget: CircleAvatar(
                        radius: 24.h,
                        backgroundImage: NetworkImage(student.img!),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 31.sp,
                    ),
                    Text(student.name!),
                    Container(
                      padding: (Get.locale!.languageCode == "ar")
                          ? EdgeInsets.only(left: 20.w)
                          : EdgeInsets.only(right: 20.w),
                      child: CircleAvatar(
                        backgroundColor: (student.status == "present")
                            ? Colors.green
                            : Colors.red,
                        radius: 10.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
