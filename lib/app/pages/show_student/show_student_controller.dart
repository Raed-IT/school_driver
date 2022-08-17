import 'package:custom_marker/marker_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/theme/app_colors.dart';

class ShowStudentController extends GetxController {
  Rx<Set<Marker>> markers = Rx(Set());
  Rxn<LatLng> studentsLocation = Rxn();
  final AuthController _authController = Get.find<AuthController>();

  Future<void> addMarker() async {
    Set<Marker> _mar = Set();
    _mar.add(Marker(
      position: studentsLocation.value!,
      icon: await MarkerIcon.downloadResizePictureCircle(
          Get.arguments['student'].img,
          size: 90.sp.toInt(),
          addBorder: true,
          borderColor: (_authController.time.value == "pm")
              ? AppColors.PRIMARY_COLOR
              : AppColors.SECONDARY_COLOR,
          borderSize: 15),
      markerId: const MarkerId('student'),
    ));
    markers(_mar);
  }
}
