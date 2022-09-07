import 'package:get/get.dart';
import 'package:school_driver/app/pages/components/snack_bar.dart';

bool chekResponse({required Response response}) {
  if (response.isOk) {
    if (response.body['status'] == "success") {
      return true;
    } else {
      showSnackBar(message: response.body['msg'], success: false);
      return false;
    }
  } else {
    // theirs error
    if (response.status.connectionError) {
      showSnackBar(message: "connection_error".tr, success: false);
      return false;
    } else if (response.status.isForbidden) {
      showSnackBar(message: "is_forbidden".tr, success: false);
      return false;
    } else if (response.status.isNotFound) {
      showSnackBar(message: "is_not_found".tr, success: false);
      return false;
    } else if (response.status.isServerError) {
      showSnackBar(message: "is_server_error".tr, success: false);
      return false;
    } else if (response.status.isUnauthorized) {
      showSnackBar(message: "is_unauthorized".tr, success: false);
      return false;
    } else {
      showSnackBar(message: "un_know_error".tr, success: false);
      return false;
    }
  }
}
