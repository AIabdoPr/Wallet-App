import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth.controller.dart';
import '../pages/add_history.page.dart';
import '../pages/history.page.dart';
import '../pages/home.page.dart';
import '../pages/settings.page.dart';
import '../pages/start.page.dart';
import '../pages/user.page.dart';

class AuthMiddleware extends GetMiddleware {
  final List<String> _authPages = [
    HomePage.routeName,
    AddHistory.routeName,
    HistoryPage.routeName,
    SettingsPage.routeName,
    UserPage.routeName,
  ];

  @override
  RouteSettings? redirect(String? route) {
    AuthController authController = Get.find<AuthController>();
    if (authController.currentUser.value != null &&
        !_authPages.contains(route)) {
      return const RouteSettings(name: HomePage.routeName);
    } else if (authController.currentUser.value == null &&
        _authPages.contains(route)) {
      return const RouteSettings(name: StartPage.routeName);
    }
    return null;
  }
}
