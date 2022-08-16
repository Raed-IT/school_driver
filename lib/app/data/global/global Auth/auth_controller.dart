import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_driver/app/data/global/get_storage.dart';
import 'package:school_driver/app/data/models/driver_model.dart';
import 'package:school_driver/app/route/routs.dart';

class AuthController extends GetxController {
  RxnString token = RxnString();
  Rxn<DriverModel> driver = Rxn<DriverModel>();
  RxString time =RxString("am");
  @override
  void onInit() {
    super.onInit();
    if (GetStorage(AppRouters.APP_NAME).hasData('token')) {
      token(StorageController.getData(key: "token"));
      driver(DriverModel.fromJson(StorageController.getData(key: "driver")));
    }
  }
}
