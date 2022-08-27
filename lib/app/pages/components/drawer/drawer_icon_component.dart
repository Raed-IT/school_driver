import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:school_driver/app/data/global/single_tone_drawer_controller.dart';


class DrawerIconComponent extends StatelessWidget {
  DrawerIconComponent({Key? key ,required this.toggleDrawer}) : super(key: key);

 void Function()?  toggleDrawer ;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu),
      color: Colors.white,
      onPressed: toggleDrawer,
    );
  }
}
