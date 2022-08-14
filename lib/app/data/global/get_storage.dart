
import 'package:get_storage/get_storage.dart';

class StorageController  {
  static String? getData ({required String key}){
    return GetStorage().read(key);
  }
  static  Future<void> setData ({required String key ,required  dynamic value }) async{
       await GetStorage().write(key, value);
  }
}