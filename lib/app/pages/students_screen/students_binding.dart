import 'package:get/get.dart';
import 'package:school_driver/app/pages/students_screen/students_controller.dart';

class StudentsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(StudentsScreenController());
  }

}