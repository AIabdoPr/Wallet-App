import 'package:get/get.dart';
import 'package:wallet_app/pages/set_ip.page.dart';

import '../middlewares/auth.middleware.dart';
import '../pages/add_history.page.dart';
import '../pages/history.page.dart';
import '../pages/home.page.dart';
import '../pages/loading.page.dart';
import '../pages/login.page.dart';
import '../pages/page.dart';
import '../pages/settings.page.dart';
import '../pages/signup.page.dart';
import '../pages/start.page.dart';
import '../pages/user.page.dart';

class RoutePkg {
  static Map<String, Page> routes = {
    SetIP.routeName: SetIP(),
    StartPage.routeName: StartPage(),
    LoginPage.routeName: LoginPage(),
    SignupPage.routeName: SignupPage(),
    HomePage.routeName: HomePage(),
    UserPage.routeName: UserPage(),
    HistoryPage.routeName: HistoryPage(),
    AddHistory.routeName: AddHistory(),
    SettingsPage.routeName: SettingsPage(),
    LoadingPage.routeName: LoadingPage(),
    "/": LoadingPage(),
  };

  static Future to(
    String routeName, {
    bool clearHeaders = false,
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) async {
    if (clearHeaders) {
      return await Get.offAndToNamed(
        routeName,
        arguments: arguments,
        id: id,
        parameters: parameters,
      );
    } else {
      return await Get.toNamed(
        routeName,
        arguments: arguments,
        id: id,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
      );
    }
  }

  static List<GetPage> get pages {
    List<GetPage> _pages = [];
    routes.forEach((key, page) {
      _pages.add(
        GetPage(
          name: key,
          page: () => page,
          middlewares: [
            AuthMiddleware(),
          ],
          title: page.pageHeaders.title,
          participatesInRootNavigator:
              page.pageHeaders.participatesInRootNavigator,
          gestureWidth: page.pageHeaders.gestureWidth,
          maintainState: page.pageHeaders.maintainState,
          curve: page.pageHeaders.curve,
          alignment: page.pageHeaders.alignment,
          parameters: page.pageHeaders.parameters,
          opaque: page.pageHeaders.opaque,
          transitionDuration: page.pageHeaders.transitionDuration,
          popGesture: page.pageHeaders.popGesture,
          binding: page.pageHeaders.binding,
          bindings: page.pageHeaders.bindings,
          transition: page.pageHeaders.transition,
          customTransition: page.pageHeaders.customTransition,
          fullscreenDialog: page.pageHeaders.fullscreenDialog,
          showCupertinoParallax: page.pageHeaders.showCupertinoParallax,
          preventDuplicates: page.pageHeaders.preventDuplicates,
        ),
      );
    });
    return _pages;
  }
}
