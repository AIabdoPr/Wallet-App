import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/pages/login.page.dart';
import 'package:wallet_app/pages/signup.page.dart';
import '../values.dart';
import 'package:wallet_app/views/button.view.dart';
import 'package:wallet_app/views/logo.view.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
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
                  Get.to(() => const LoginPage());
                },
                text: "Login",
              ),
              ButtonView(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                onPressed: () {
                  Get.to(() => const SignupPage());
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
