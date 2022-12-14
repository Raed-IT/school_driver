import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:school_driver/app/data/global/get_storage.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/data/global/global%20Auth/check_response.dart';
import 'package:school_driver/app/data/models/driver_model.dart';
import 'package:school_driver/app/data/providers/login_provider.dart';
import 'package:school_driver/app/pages/components/snack_bar.dart';
import 'package:school_driver/app/route/routs.dart';

class LoginScreenController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool rememberMe = RxBool(false);
  final LoginProvider _loginProvider = LoginProvider();
  final AuthController _authController = Get.find<AuthController>();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        EasyLoading.show(
          dismissOnTap: true,
        );
        await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
        final status = await OneSignal.shared.getDeviceState();
        final String? osUserID = status?.userId;
        Response res = await _loginProvider.login({
          "username": usernameController.text,
          "password": passwordController.text,
          "token": osUserID!,
        });
        print(res.body);
        bool result = chekResponse(response: res);
        if (result) {
          _authController.driver(DriverModel.fromJson(res.body['driver']));
          _authController.token(res.body['token']);
          EasyLoading.showSuccess("success".tr);
          // store driver data to local storage
          await StorageController.setData(
              key: "driver", value: res.body['driver']);
          await StorageController.setData(
              key: 'token', value: res.body['token']);
          Get.offAllNamed(AppRouters.HOME_SCREEN);
        } else {
          EasyLoading.showError("error".tr);
        }
      } catch (e) {
        EasyLoading.showError("error".tr);
        showSnackBar(message: "$e", success: false);
      }
    }
  }
}
