import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:wallet_app/controllers/auth.controller.dart';
import 'package:wallet_app/pages/signup.page.dart';
import '../values.dart';
import 'package:wallet_app/views/button.view.dart';
import 'package:wallet_app/views/text_edit.view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthController authController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    authController = AuthController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    authController.dispose();
    emailController.dispose();
    passwordController.dispose();
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  onPressed: () => authController.login(
                    emailController.text,
                    passwordController.text,
                  ),
                  text: "Login",
                ),
                TextButton(
                    onPressed: () => Get.to(() => const SignupPage()),
                    child: const Text("Signup")),
                TextButton(
                  onPressed: () {},
                  child: const Text("forget password"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
