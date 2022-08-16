// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/route/routs.dart';

class IsLoginMiddleware extends GetMiddleware {
  final AuthController _authController =Get.find<AuthController>();
  AuthController authController = Get.find<AuthController>();
  @override
  RouteSettings? redirect(String? route) {
    // print (" ================= ${_authController.token.value}");
      if (_authController.token.value==null) {
        return const RouteSettings(name: AppRouters.LOGIN_SCREEN);
      }
    return null;

  }
}
