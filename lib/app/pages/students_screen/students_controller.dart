import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/data/global/global%20Auth/check_response.dart';
import 'package:school_driver/app/data/global/my_exception.dart';
import 'package:school_driver/app/data/models/students_model.dart';
import 'package:school_driver/app/data/providers/students_provider.dart';
import 'package:school_driver/app/pages/components/snack_bar.dart';

class StudentsScreenController extends GetxController {
  RxList<StudentsModel> students = RxList<StudentsModel>([]);

  final StudentsProvider _studentsProvider = StudentsProvider();
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  TextEditingController searchController = TextEditingController();

  final listKye = GlobalKey<AnimatedListState>();
  RxBool isLoadStudents = RxBool(true);

//  control by opacity for in appBar   image
  ScrollController scrollController = ScrollController();
  RxDouble opacity = RxDouble(1);

  void _listingScrollController() {
    opacity.value = 1 - (scrollController.offset / 140);
    if (opacity.value > 1) {
      opacity(1);
    }
    if (opacity.value < 0) {
      opacity(0);
    }
  }

  @override
  void onInit() {
    scrollController.addListener(_listingScrollController);
    getStudents();
  }

  Future<void> getStudents() async {
    try {
      isLoadStudents(true);
      Response res = await _studentsProvider.getStudents(
          time: Get.find<AuthController>().time.value,
          search: searchController.text);
      isLoadStudents(false);
      bool result = chekResponse(response: res);
      if (result) {
        students.clear();
        for (var item in res.body['students']) {
          students.add(StudentsModel.fromJson(item));
        }
      }
    } catch (e) {
      isLoadStudents(false);
      showSnackBar(message: "$e", success: false);
    }
  }
}
