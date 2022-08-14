import 'package:get/get.dart';
import 'package:school_driver/app/data/middelwares/is_login.dart';
import 'package:school_driver/app/pages/home_screen/home_binding.dart';
import 'package:school_driver/app/pages/home_screen/home_screen.dart';
import 'package:school_driver/app/route/routs.dart';

class homePage extends GetPage{
  homePage():super(
    name: AppRouters.HOME,
    binding: HomeBinding(),
    page: ()=>HomeScreen(),
    middlewares: [IsLoginMiddleware()]
  );
}