import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
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
    isLoadStudents(true);
    try {
      Response res = await _studentsProvider.getStudents(
          time: Get.find<AuthController>().time.value,
          search: searchController.text);
      isLoadStudents(false);
      students.clear();
      if (res.statusCode == 200) {
        for (var item in res.body['students']) {
           students.add(StudentsModel.fromJson(item));
        }
      } else if (res.statusCode == null) {
        throw (MyException('no_connect_to_internet'.tr));
      }
    } on MyException catch (e) {
      print(e);
      showSnackBar(message: "$e", success: false);
    } catch (e) {
      print(e);
      showSnackBar(message: "$e", success: false);
    }
  }
}
