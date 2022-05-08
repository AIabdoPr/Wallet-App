import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/pages/loading.page.dart';

import 'values.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Consts.appName,
      theme: ThemeData(
        fontFamily: "DMSans",
        primaryColor: UIColors.primary,
        backgroundColor: UIColors.primary,
      ),
      home: const LoadingPage(),
    );
  }
}
