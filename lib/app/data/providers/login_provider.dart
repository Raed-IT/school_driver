import 'package:get/get.dart';
import 'package:school_driver/app/data/routs_api.dart';

class LoginProvider extends GetConnect{
  Future<Response> login (Map<String ,String> data )=>post(RouterApi.LOGIN, data);
}