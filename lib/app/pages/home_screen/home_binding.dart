import 'package:get/get.dart';
import 'package:school_driver/app/pages/home_screen/home_conteoller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}