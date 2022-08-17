import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/pages/components/avatar_component.dart';
import 'package:school_driver/app/pages/map_screen/map_screen.dart';
import 'package:school_driver/app/pages/show_student/show_student_controller.dart';
import 'package:school_driver/app/theme/app_colors.dart';

class ShowStudentScreen extends StatelessWidget {
  final ShowStudentController _controller = Get.find<ShowStudentController>();
  final AuthController _authController = Get.find();
  TextStyle? style;

  TextStyle? dec;

  @override
  Widget build(BuildContext context) {
    style = Theme.of(context).textTheme.headline1;
    dec = TextStyle(
      fontSize: style!.fontSize! - 5.sp,
      color: AppColors.DARK_COLOR,
    );
    _controller.studentsLocation(LatLng(
        double.parse(Get.arguments['student'].lat),
        double.parse(Get.arguments['student'].long)));
    _controller.addMarker();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          320.h,
        ),
        child: Hero(
          flightShuttleBuilder: (
            BuildContext flightContext,
            Animation<double> animation,
            HeroFlightDirection flightDirection,
            BuildContext fromHeroContext,
            BuildContext toHeroContext,
          ) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, value) {
                return AnimatedOpacity(
                  opacity: animation.value,
                  duration: const Duration(microseconds: 100),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 35.sp),
                        height: 280.h,
                        decoration: BoxDecoration(
                          color: (_authController.time.value == "pm")
                              ? AppColors.PRIMARY_COLOR
                              : AppColors.SECONDARY_COLOR,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.sp),
                            bottomLeft: Radius.circular(20.sp),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: AvatarComponent(
                            radius: 75.sp,
                            widget: (Get.arguments != null)
                                ? CircleAvatar(
                                    radius: 70.sp,
                                    backgroundImage: NetworkImage(
                                        Get.arguments['student'].img),
                                  )
                                : CircleAvatar(
                                    radius: 70.sp,
                                    backgroundImage:
                                        AssetImage('assets/images/avatar.png'),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          transitionOnUserGestures: true,
          tag: Get.arguments['student'].address,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 35.sp),
                height: 280.h,
                decoration: BoxDecoration(
                  color: (_authController.time.value == "pm")
                      ? AppColors.PRIMARY_COLOR
                      : AppColors.SECONDARY_COLOR,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.sp),
                    bottomLeft: Radius.circular(20.sp),
                  ),
                ),
              ),
              Positioned(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AvatarComponent(
                    radius: 75.sp,
                    widget: CircleAvatar(
                      radius: 70.sp,
                      backgroundImage:
                          NetworkImage(Get.arguments['student'].img),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            "${'student_name'.tr} : ${Get.arguments['student'].name}",
            style: TextStyle(
              fontSize: style!.fontSize,
              color: AppColors.DARK_COLOR,
              fontWeight: style!.fontWeight,
            ),
          ),
          Divider(
            endIndent: 30.0.w,
            thickness: 1.2.sp,
            indent: 30.0.w,
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.DARK_COLOR.withOpacity(.2),
                      width: 1.2.sp,
                    ),
                  ),
                ),
                child: Text(
                  "${'section'.tr}:",
                  style: dec,
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Text(
                "${Get.arguments['student'].section}",
                style: dec,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      style: BorderStyle.solid,
                      color: AppColors.DARK_COLOR.withOpacity(.2),
                      width: 1.2.sp,
                    ),
                  ),
                ),
                child: Text(
                  "${'department'.tr}:",
                  style: dec,
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Text(
                "${Get.arguments['student'].department}",
                style: dec,
              ),
            ],
          ),
          Obx(
            () => Container(
              margin: EdgeInsets.all(30.sp),
              child: SizedBox(
                height: 130.h,
                child: GoogleMap(
                  zoomControlsEnabled: false,
                  onTap: (d) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapScreen(
                              studentsPosition:
                                  _controller.studentsLocation.value!,
                              marker: _controller.markers.value)),
                    );
                  },
                  //Map widget from google_maps_flutter package
                  zoomGesturesEnabled: true,
                  //enable Zoom in, out on map
                  initialCameraPosition: CameraPosition(
                    //innital position in map
                    target: _controller.studentsLocation.value!,
                    //initial position
                    zoom: 17.0, //initial zoom level
                  ),
                  markers: _controller.markers.value,
                  //markers to show on map
                  mapType: MapType.satellite,
                  //map type
                  onMapCreated: (controller) {
                    //method called when map is created
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
