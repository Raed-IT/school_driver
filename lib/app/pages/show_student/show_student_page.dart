
import 'package:get/get.dart';
import 'package:school_driver/app/pages/show_student/show_student_binding.dart';
import 'package:school_driver/app/pages/show_student/show_student_screen.dart';
import 'package:school_driver/app/route/routs.dart';

class ShowStudentPage  extends GetPage{
  ShowStudentPage():super(
      name: AppRouters.SHOW_STUDENT,
      page: () => ShowStudentScreen(),
      binding: ShowStudentBinding(),
      transition:  Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 500));
}