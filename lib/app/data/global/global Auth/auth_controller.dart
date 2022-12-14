import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_driver/app/data/global/get_storage.dart';
import 'package:school_driver/app/data/models/driver_model.dart';
import 'package:school_driver/app/route/routs.dart';

class AuthController extends GetxController {
  RxnString token = RxnString();
  Rxn<DriverModel> driver = Rxn<DriverModel>();
  ZoomDrawerController drawerController = ZoomDrawerController();
  RxString time = RxString("am");

  @override
  void onInit() {
    super.onInit();
    chackAuth();
  }

  void chackAuth() {
    if (GetStorage(AppRouters.APP_NAME).hasData('token')) {
      List<String> keyModel =
          StorageController.getData(key: "driver").keys.toList();
       if (keyModel.contains('logo')) {
        token(StorageController.getData(key: "token"));
        driver(
          DriverModel.fromJson(
            StorageController.getData(key: "driver"),
          ),
        );
      } else {
        GetStorage(AppRouters.APP_NAME).erase();
        chackAuth();
      }
    }
  }
}
