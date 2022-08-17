import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/pages/components/avatar_component.dart';
import 'package:school_driver/app/route/routs.dart';
import 'package:school_driver/app/theme/app_colors.dart';

class MenuDrawerComponent extends StatelessWidget {
  MenuDrawerComponent({Key? key}) : super(key: key);
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    TextStyle? style = Theme.of(context).textTheme.headline1;
    return Column(
      children: [
        SizedBox(height: 150.h),
        AvatarComponent(
          bgColor: AppColors.PRIMARY_COLOR,
          widget: CircleAvatar(
            radius: 50.sp,
            backgroundImage: NetworkImage(_authController.driver.value!.img!),
          ),
        ),
        Text(
          _authController.driver.value!.name!,
          style:
              TextStyle(fontSize: style!.fontSize, color: AppColors.DARK_COLOR),
        ),
        SizedBox(
          height: 50.h,
        ),
        SizedBox(
          width: 150.w,
          child: MaterialButton(
            color: AppColors.SCAFFOLD_COLOR,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0.sp),
                side: BorderSide(width: 2.sp, color: AppColors.PRIMARY_COLOR)),
            onPressed: () {
              GetStorage(AppRouters.APP_NAME).erase();
              Get.offAllNamed(AppRouters.LOGIN_SCREEN);
            },
            child: Text('logout'.tr),
          ),
        )
      ],
    );
  }
}
