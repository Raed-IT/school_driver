import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:school_driver/app/pages/components/logo_component.dart';
import 'package:school_driver/app/route/routs.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.offAllNamed(AppRouters.HOME_SCREEN);
      },
    );
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: SvgPicture.asset('assets/images/BG.svg', fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoComponent(
                height: 250.h,
                width: 200.w,
              ),
              Center(
                child: Text(
                  'company'.tr,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
/*

 Container(
          

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Lottie.asset ('assets/jsons/logo.json',width: 200.w ,height:  200.h)),
              Center(child: Text('company'.tr,)),
            ],
          ),
        ),

 */
