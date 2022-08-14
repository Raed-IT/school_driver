
import 'package:get/get.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_binding.dart';
import 'package:school_driver/app/pages/login_screen/login_binding.dart';
import 'package:school_driver/app/pages/login_screen/login_screen.dart';
import 'package:school_driver/app/pages/splash_screen/splash_screen.dart';
import 'package:school_driver/app/route/routs.dart';

class LoginPage  extends GetPage{
  LoginPage():super(
      name: AppRouters.LOGIN_SCREEN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
      transitionDuration: const Duration(milliseconds: 500));

}