import 'package:flutter_zoom_drawer/config.dart';

class SingleToneDrawerController {
  late ZoomDrawerController _zoomDrawerController;

  ZoomDrawerController get zoomDrawerController => _zoomDrawerController;

  set zoomDrawerControllerSetter(ZoomDrawerController drawerController) {
    _zoomDrawerController = drawerController;
  }


}
