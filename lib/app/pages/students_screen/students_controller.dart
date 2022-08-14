import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentsScreenController extends GetxController {
//  control by opacity for in appBar   image
  ScrollController scrollController = ScrollController();
  RxDouble opacity = RxDouble(1);

  void listingScrollController() {
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
    scrollController.addListener(listingScrollController);
  }
}
