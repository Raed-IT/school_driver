
import 'package:get/get.dart';
 import 'package:school_driver/app/pages/login_screen/login_controller.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(LoginScreenController());
  }
}