import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pkgs/route.pkg.dart';
import '../values.dart';
import '../views/button.view.dart';
import '../views/logo.view.dart';
import 'login.page.dart';
import 'page.dart' as page;
import 'signup.page.dart';

class StartPage extends page.Page {
  static const String routeName = "/start";

  StartPage({Key? key}) : super(key: key);

  @override
  Widget buildBody(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: UIThemeColors.bg,
        body: SizedBox.expand(
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const LogoView(),
              const Spacer(),
              ButtonView(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                onPressed: () {
                  RoutePkg.to(LoginPage.routeName);
                },
                text: "Login",
              ),
              ButtonView(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                onPressed: () {
                  RoutePkg.to(SignupPage.routeName);
                },
                text: "Signup",
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
