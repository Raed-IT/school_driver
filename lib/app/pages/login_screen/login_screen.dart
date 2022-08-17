import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_driver/app/pages/components/logo_component.dart';
import 'package:school_driver/app/pages/login_screen/login_controller.dart';
import 'package:school_driver/app/theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final LoginScreenController _controller = Get.find<LoginScreenController>();
    return Scaffold(
      extendBody: true,
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child:
                  SvgPicture.asset('assets/images/BG.svg', fit: BoxFit.cover),
            ),
            SingleChildScrollView(
              child: Container(
                height: size.height,
                width: size.width,
                padding: EdgeInsets.only(left: 40.w, right: 40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: LogoComponent(
                        height: 250.h,
                        width: 270.w,
                      ),
                    ),
                    const Spacer(flex: 2),
                    Form(
                      key: _controller.formKey,
                      child: Column(
                        children: [
                          buildTextFieldWidget(
                            icon: Icons.account_box_outlined,
                            hint: "user_name",
                            textEditingController:
                                _controller.usernameController,
                            validator: (d) {
                              if (d!.isEmpty) {
                                return "required".tr;
                              } else if (d.length < 4) {
                                return "validation_short".tr;
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          buildTextFieldWidget(
                              icon: Icons.lock,
                              hint: "password",
                              textEditingController:
                                  _controller.passwordController,
                              validator: (d) {
                                if (d!.isEmpty) {
                                  return "required".tr;
                                }
                                if (d.length < 8) {
                                  return "required_short_password".tr;
                                }
                                return null;
                              }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Obx(() => Checkbox(
                                        activeColor: AppColors.LABLE_COLOR,
                                        value: _controller.rememberMe.value,
                                        onChanged: (val) {
                                          _controller.rememberMe(val);
                                        },
                                      )),
                                  Text(
                                    "remember_me".tr,
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'forget_password'.tr,
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                              height: 40.h,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(500.sp),
                              ),
                              onPressed: _controller.login,
                              color: AppColors.SECONDARY_COLOR,
                              child: Text(
                                'register'.tr,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextFieldWidget(
      {required TextEditingController textEditingController,
      required IconData icon,
      required String hint,
      String? Function(String?)? validator}) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
        filled: true,
        fillColor: AppColors.SCAFFOLD_COLOR,
        prefixIcon: Container(
          width: 50.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: (Get.locale!.languageCode == "ar")
                ? BorderRadius.only(
                    topRight: Radius.circular(25.sp),
                    bottomRight: Radius.circular(25.sp),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(25.sp),
                    bottomLeft: Radius.circular(25.sp),
                  ),
          ),
          margin: (Get.locale!.languageCode == "ar")
              ? EdgeInsets.only(left: 10.w)
              : EdgeInsets.only(right: 10.w),
          child: Icon(
            icon,
            color: AppColors.DARK_COLOR,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.sp),
        ),
        hintText: hint.tr,
      ),
    );
  }
}
