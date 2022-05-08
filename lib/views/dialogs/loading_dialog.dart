import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values.dart';

class LoadingDialog extends StatelessWidget {
  final Color? dialogBackgroundColor;
  final Color? messageColor;
  final String message;
  final double dialogRadius;

  const LoadingDialog({
    Key? key,
    this.dialogBackgroundColor,
    this.message = 'Please wait...',
    this.messageColor,
    this.dialogRadius = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(dialogRadius)),
          backgroundColor: dialogBackgroundColor ?? UIThemeColors.accent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(dialogRadius),
              color: dialogBackgroundColor ?? UIThemeColors.accent,
            ),
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width * .7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, right: 3, left: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: messageColor ?? UIDarkColors.text1,
                          fontSize: 16,
                          fontFamily: Consts.fontFamily,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10)),
                      const CircularProgressIndicator(color: UIColors.primary),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
