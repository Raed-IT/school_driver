import 'package:get/get.dart';
import 'package:school_driver/app/pages/home_screen/home_page.dart';
import 'package:school_driver/app/pages/login_screen/login_page.dart';
import 'package:school_driver/app/pages/splash_screen/splash_page.dart';
import 'package:school_driver/app/pages/students_screen/students_page.dart';

class GetPagesProvider {
  static List<GetPage> getPages = [
    SplashPage(),
    StudentsPage(),
    LoginPage(),
    homePage(),
  ];
}
