import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/auth.controller.dart';
import '../pkgs/size_config.pkg.dart';
import '../values.dart';

class InternetStatus extends StatelessWidget {
  const InternetStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig(context);
    return Obx(
      () => Visibility(
        visible: Get.find<AuthController>().isOffline.value,
        child: Positioned(
          bottom: 70,
          left: 20,
          width: sizeConfig.screenWidth - 40,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.wifi_off_rounded,
                      color: UIDarkColors.text,
                    ),
                    Gap(10),
                    Text(
                      "You are offline",
                      style: TextStyle(
                        fontSize: 16,
                        color: UIDarkColors.text,
                        fontFamily: Consts.fontFamily,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                // Text(
                //   "Error: " +
                //       Get.find<SocketController>()
                //           .connectionErrorMessage
                //           .string,
                //   style: const TextStyle(
                //     fontSize: 16,
                //     color: UIDarkColors.text1,
                //     fontFamily: Consts.fontFamily,
                //     decoration: TextDecoration.none,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
