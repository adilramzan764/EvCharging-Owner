import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'View Model/UserViewModel.dart';
import 'View/First Page/First Page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  // WidgetsFlutterBinding.ensureInitialized();
  //
  // // Initialize your UserViewModel and call getUserData
  // final userViewModel = UserViewModel();
  // await userViewModel.getUserData();

  runApp(const MyApp());
  configLoading();

}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.orange
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        // builder: (context, child) => ResponsiveBreakpoints.builder(
        //   child: child!,
        //   breakpoints: [
        //     Breakpoint(start: 0, end: 450, name: MOBILE),
        //     Breakpoint(start: 451, end: 800, name: TABLET),
        //     Breakpoint(start: 801, end: 1920, name: DESKTOP),
        //     Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        //   ],
        // ),
        debugShowCheckedModeBanner: false,
        home: FirstPage(),
        builder: EasyLoading.init(),

      );}
    );
  }
}
