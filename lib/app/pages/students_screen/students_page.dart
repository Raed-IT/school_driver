
import 'package:get/get.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_binding.dart';
import 'package:school_driver/app/data/middelwares/is_login.dart';
import 'package:school_driver/app/pages/splash_screen/splash_screen.dart';
import 'package:school_driver/app/pages/students_screen/students_binding.dart';
import 'package:school_driver/app/pages/students_screen/students_screen.dart';
import 'package:school_driver/app/route/routs.dart';

class StudentsPage  extends GetPage{
  StudentsPage():super(
      name: AppRouters.STUDENTS_SCREEN,
      page: () => StudentsScreen(),
      binding: StudentsBinding(),
      transitionDuration: const Duration(milliseconds: 500),
    middlewares: [IsLoginMiddleware()]
  );

}