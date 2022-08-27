import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

  import 'package:school_driver/app/pages/components/drawer/menu_drawer_component.dart';

class DrawerComponent extends StatelessWidget {
  // final AuthController   = Get.find();
  Widget child;
 late ZoomDrawerController zoomDrawerController ;

  DrawerComponent({Key? key, required this.child ,required this.zoomDrawerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
          controller: zoomDrawerController,
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
