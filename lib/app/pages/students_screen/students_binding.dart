import 'package:get/get.dart';
import 'package:school_driver/app/data/providers/students_provider.dart';
import 'package:school_driver/app/pages/students_screen/students_controller.dart';

class StudentsBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => StudentsProvider());
    Get.put(StudentsScreenController());
  }

}