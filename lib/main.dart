import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_binding.dart';
import 'package:school_driver/app/data/global/global%20Auth/auth_controller.dart';
import 'package:school_driver/app/data/global/translation_app.dart';
import 'package:school_driver/app/route/get_pages.dart';
import 'package:school_driver/app/route/routs.dart';
import 'package:school_driver/app/theme/app_colors.dart';
import 'package:school_driver/app/theme/them_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init(AppRouters.APP_NAME);
  Get.put(AuthController(), permanent: true);
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
    );
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => GetMaterialApp(
        theme: ThemeAppData.themeData,
        initialRoute: AppRouters.STUDENTS_SCREEN,
        getPages: GetPagesProvider.getPages,
        debugShowCheckedModeBanner: false,
        translations: TranslationApp(),
        locale: const Locale('ar'),
        fallbackLocale: const Locale('ar'),
        initialBinding: AuthBinding(),
        home: Scaffold(
          body: Container(),
        ),
      ),
    );
  }
}
