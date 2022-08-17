import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LogoComponent extends StatelessWidget {
  double? height;
  double? width;
    LogoComponent({Key? key, this .height , this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Lottie.asset('assets/jsons/logo.json',
        width: width??100.w, height: height ?? 200.h,fit: BoxFit.cover);
  }
}
