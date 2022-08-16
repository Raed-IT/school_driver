import 'package:get/get.dart';
import 'package:school_driver/app/pages/home_screen/home_conteoller.dart';
import 'package:school_driver/app/pages/students_screen/students_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentsScreenController());
    Get.put(HomeController());
  }
}
