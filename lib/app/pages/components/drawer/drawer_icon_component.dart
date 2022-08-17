import 'package:flutter/material.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:get/get.dart';

class DrawerIconComponent extends StatelessWidget {
  DrawerIconComponent({Key? key}) : super(key: key);
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu),
      color: Colors.white,
      onPressed: () {
        print ('================');
        _authController.drawerController.toggle?.call();
      },
    );
  }
}
