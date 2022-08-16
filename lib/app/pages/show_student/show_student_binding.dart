import 'package:get/get.dart';
import 'package:school_driver/app/pages/show_student/show_student_controller.dart';

class ShowStudentBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(ShowStudentController());
  }
}