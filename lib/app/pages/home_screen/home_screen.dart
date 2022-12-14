import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/pages/components/avatar_component.dart';
import 'package:school_driver/app/pages/components/drawer/drawer_component.dart';
import 'package:school_driver/app/pages/components/drawer/drawer_icon_component.dart';
import 'package:school_driver/app/pages/home_screen/home_conteoller.dart';
import 'package:school_driver/app/route/routs.dart';
import 'package:school_driver/app/theme/app_colors.dart';
import 'package:show_up_animation/show_up_animation.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final AuthController _authController = Get.find<AuthController>();
  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DrawerComponent(
        zoomDrawerController: _homeController.zoomDrawerController,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 2,
            toolbarHeight: 320.h,
            flexibleSpace: SafeArea(
              child: SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(18.0.sp),
                          child: DrawerIconComponent(
                              toggleDrawer: () => _homeController
                                  .zoomDrawerController.toggle!
                                  .call()),
                        )
                      ],
                    ),
                    ShowUpAnimation(
                      animationDuration: const Duration(seconds: 2),
                      offset: 0.5,
                      child: Column(
                        children: [
                          AvatarComponent(
                            radius: 75.sp,
                            widget: (_authController.driver.value!.img == " ")
                                ? CircleAvatar(
                                    radius: 70.sp,
                                    backgroundImage:
                                        const AssetImage("assets/images/1.jpg"),
                                  )
                                : CircleAvatar(
                                    radius: 70.sp,
                                    backgroundImage: NetworkImage(
                                        "${_authController.driver.value?.img}"),
                                  ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            "${'driver_name'.tr}${_authController.driver.value!.name.toString()}",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            "${'phone_number'.tr} ${_authController.driver.value!.phone.toString()} ",
                            style: Theme.of(context).textTheme.headline2,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: WillPopScope(
            onWillPop: () async {
              bool isCloseApp = false;
              await Get.dialog(
                AlertDialog(
                  backgroundColor: AppColors.SECONDARY_COLOR.withOpacity(.5),
                  title: Text('clos_app_content'.tr,
                      style: Theme.of(context).textTheme.headline2),
                  actions: [
                    SizedBox(
                      width: 90.w,
                      child: MaterialButton(
                        child: Text(
                          "close".tr,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        onPressed: () {
                          isCloseApp = true;
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 70.w,
                      child: MaterialButton(
                        child: Text("no".tr,
                            style: Theme.of(context).textTheme.headline2),
                        onPressed: () {
                          isCloseApp = false;
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              );
              return isCloseApp;
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  buildButton(
                      json: "assets/jsons/sunshine.json",
                      tag: 'morning',
                      onTap: () {
                        Get.find<AuthController>().time('am');
                        Get.toNamed(AppRouters.STUDENTS_SCREEN,
                            arguments: {'json': "assets/jsons/sunshine.json"});
                      },
                      context: context,
                      bgAvatarColor: AppColors.SECONDARY_COLOR,
                      label: 'morning_shift',
                      bgColor: AppColors.SECONDARY_GRADIENT_COLOR),
                  buildButton(
                      json: "assets/jsons/Moon-light.json",
                      tag: 'evening',
                      onTap: () {
                        Get.find<AuthController>().time('pm');
                        Get.toNamed(AppRouters.STUDENTS_SCREEN, arguments: {
                          'json': "assets/jsons/Moon-light.json"
                        });
                      },
                      context: context,
                      bgAvatarColor: AppColors.PRIMARY_COLOR,
                      label: 'evening_shift',
                      bgColor: AppColors.MAIN_GRADIENT_COLOR,
                      alignment: Alignment.centerLeft),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*

  */
  Widget buildButton({
    required String label,
    required List<Color> bgColor,
    Alignment? alignment,
    required Color bgAvatarColor,
    required BuildContext context,
    required void Function()? onTap,
    required String tag,
    required String json,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 40.w, left: 40.w),
        height: 100.h,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: bgColor,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                  borderRadius: BorderRadius.circular(500.sp),
                ),
                height: 40.h,
                width: double.infinity,
                child: Center(
                  child: Padding(
                    padding: (alignment == Alignment.centerLeft)
                        ? EdgeInsets.only(left: 40.w)
                        : EdgeInsets.only(right: 40.w),
                    child: Text(
                      label.tr,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ),
              ),
            ),
            Hero(
              transitionOnUserGestures: true,
              tag: tag,
              child: Align(
                alignment: alignment ?? Alignment.centerRight,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(500.sp),
                    ),
                  ),
                  margin: const EdgeInsets.all(0),
                  elevation: 7,
                  child: AvatarComponent(
                    bgColor: Colors.white,
                    radius: 37.sp,
                    widget: CircleAvatar(
                      backgroundColor: bgAvatarColor,
                      radius: 35.sp,
                      child: Lottie.asset(json),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
