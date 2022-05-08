import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wallet_app/controllers/auth.controller.dart';
import 'package:wallet_app/pages/login.page.dart';

import '../values.dart';
import '../views/button.view.dart';
import '../views/text_edit.view.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late AuthController authController;

  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmController;

  @override
  void initState() {
    super.initState();
    authController = AuthController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
  }

  @override
  void deactivate() {
    super.deactivate();
    authController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: UIThemeColors.bg,
        body: SizedBox.expand(
          child: SingleChildScrollView(
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
                  "Signup",
                  style: TextStyle(
                    color: UIThemeColors.text,
                    fontSize: 36,
                    fontFamily: Consts.fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap(15),
                TextEditView(controller: usernameController, hint: "Username"),
                TextEditView(controller: emailController, hint: "Email"),
                TextEditView(
                  controller: passwordController,
                  hint: "Password",
                  entryType: TextInputType.visiblePassword,
                ),
                TextEditView(
                  controller: confirmController,
                  hint: "Confirm",
                  entryType: TextInputType.visiblePassword,
                ),
                const Gap(15),
                ButtonView(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  onPressed: () => authController.signup(
                    usernameController.text,
                    emailController.text,
                    passwordController.text,
                    confirmController.text,
                  ),
                  text: "Signup",
                ),
                TextButton(
                  onPressed: () => Get.to(() => const LoginPage()),
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
