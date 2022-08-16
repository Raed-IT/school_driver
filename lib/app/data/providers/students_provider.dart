import 'dart:io';

import 'package:get/get.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/data/routs_api.dart';

class StudentsProvider extends GetConnect {
  final AuthController _authController = Get.find();

  Future<Response> getStudents({required String time, String? search}) async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${_authController.token}"
    };
    return get("${RouterApi.STUDENTS}time=$time&search=$search", headers: headers);
  }
}
