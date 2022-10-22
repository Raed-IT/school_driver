import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/theme/app_colors.dart';

import '../../route/routs.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Future.delayed(
      const Duration(seconds: 4),
          () => Get.offAllNamed(AppRouters.HOME_SCREEN),
    );
    return Scaffold(
      body: Center(
        child: Get.find<AuthController>().driver.value == null
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/jsons/logo1.json',
                width: 250.w, height: 200.h),
            Text(
              'company'.tr,
              style: TextStyle(
                  color: AppColors.PRIMARY_COLOR,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
            : Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                Get.find<AuthController>().driver.value!.logo!,
                width: 150.w,
                height: 150.h,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                Get.find<AuthController>().driver.value!.schoolName!,
                style: TextStyle(
                    color: AppColors.PRIMARY_COLOR,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
