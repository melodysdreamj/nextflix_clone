import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nextflix_clone/page/vm.dart';
import 'package:nextflix_clone/util/logger/ready.dart';
import 'package:nextflix_clone/util/tmdb/ready.dart';

startApp(Widget home) async {
  await readyForRunAppStart();
  return runApp(ScreenUtilInit(
      designSize: const Size(360, 960), builder: () => MyApp(home)));
}

class MyApp extends StatelessWidget {
  MyApp(this.home, {Key? key}) : super(key: key);
  final Widget home;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "movie practice app",
      theme: FlexThemeData.light(scheme: FlexScheme.indigo),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.indigo),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      onInit: () async {
        return await readyForAppStart(context);
      },
      home: home,
    );
  }
}

readyForRunAppStart() {}

readyForAppStart(BuildContext context) async {
  Get.put(HomeViewModel());

  await readtForTMDB();
  await readyForLogger();

}
