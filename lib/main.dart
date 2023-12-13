import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'View/First Page/First Page.dart';

void main() {
  runApp(const MyApp());
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
      );}
    );
  }
}
