import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/pages/components/drawer/menu_drawer_component.dart';

class DrawerComponent extends StatelessWidget {
  final AuthController _authController = Get.find();
  Widget child;

  DrawerComponent({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
          controller: _authController.drawerController,
          menuScreen: MenuDrawerComponent(),
          mainScreen: child,
          borderRadius: 24.0,
          showShadow: false,
          angle: -12.0,
          drawerShadowsBackgroundColor: Colors.grey[300]!,
          slideWidth: MediaQuery.of(context).size.width * 0.65),
    );
  }
}
