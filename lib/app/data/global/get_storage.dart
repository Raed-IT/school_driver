
import 'package:get_storage/get_storage.dart';
import 'package:school_driver/app/route/routs.dart';

class StorageController  {
  static dynamic? getData ({required String key}){
    return GetStorage(AppRouters.APP_NAME).read(key);
  }
  static  Future<void> setData ({required String key ,required  dynamic value }) async{
       await GetStorage(AppRouters.APP_NAME).write(key, value);
  }
}