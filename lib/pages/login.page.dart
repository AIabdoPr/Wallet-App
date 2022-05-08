import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/auth.controller.dart';
import '../pkgs/route.pkg.dart';
import '../values.dart';
import '../views/button.view.dart';
import '../views/text_edit.view.dart';
import 'page.dart' as page;
import 'signup.page.dart';

class LoginPage extends page.Page {
  static const String routeName = "/login";

  LoginPage({Key? key}) : super(key: key);

  late AuthController authController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    authController = AuthController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    authController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Gap(60),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: UIThemeColors.iconBg,
                  ),
                ),
              ),
            ),
            const Gap(40),
            Text(
              "Login",
              style: TextStyle(
                color: UIThemeColors.text,
                fontSize: 36,
                fontFamily: Consts.fontFamily,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(15),
            TextEditView(controller: emailController, hint: "Email"),
            TextEditView(
              controller: passwordController,
              hint: "Password",
              entryType: TextInputType.visiblePassword,
            ),
            const Gap(15),
            ButtonView(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              onPressed: () => authController.login(
                emailController.text,
                passwordController.text,
              ),
              text: "Login",
            ),
            TextButton(
                onPressed: () => RoutePkg.to(SignupPage.routeName),
                child: const Text("Signup")),
            TextButton(
              onPressed: () {},
              child: const Text("forget password"),
            ),
          ],
        ),
      ),
    );
  }
}
