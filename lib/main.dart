import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/pages/set_ip.page.dart';

import 'controllers/auth.controller.dart';
import 'controllers/main.controller.dart';
import 'pages/loading.page.dart';
import 'pkgs/route.pkg.dart';
import 'values.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put<MainController>(MainController());
    Get.put<AuthController>(AuthController());
    return GetMaterialApp(
      title: Consts.appName,
      theme: ThemeData(
        fontFamily: "DMSans",
        primaryColor: UIColors.primary,
        backgroundColor: UIColors.primary,
      ),
      getPages: RoutePkg.pages,
      initialRoute: SetIP.routeName,
      home: SetIP(),
    );
  }
}
