import 'package:flutter/material.dart';
import 'package:wallet_app/values.dart';

// ignore: must_be_immutable
class MessageDialog extends StatelessWidget {
  final Color? dialogBackgroundColor;
  final Color? titleColor;
  final Color? messageColor;
  final Color? buttonOkColor;
  final String title;
  final String message;
  final String buttonOkText;
  final Function? buttonOkOnPressed;
  final double dialogRadius;
  final double buttonRadius;
  final Icon? iconButtonOk;

  const MessageDialog({
    Key? key,
    this.dialogBackgroundColor,
    this.buttonOkColor,
    this.title = 'Dialog Title',
    this.titleColor,
    this.message = 'Dialog Message',
    this.messageColor,
    this.buttonOkText = 'Ok',
    this.buttonOkOnPressed,
    this.dialogRadius = 15,
    this.buttonRadius = 18,
    this.iconButtonOk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dialogRadius)),
      backgroundColor: dialogBackgroundColor ?? UIThemeColors.accent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(dialogRadius),
          color: dialogBackgroundColor ?? UIThemeColors.accent,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 3, right: 3, bottom: 4),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: titleColor ?? UIDarkColors.text,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 16,
                right: 3,
                left: 3,
              ),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: messageColor ?? UIDarkColors.text1,
                  fontSize: 16,
                  fontFamily: Consts.fontFamily,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 3, right: 3),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: iconButtonOk == null
                        ? TextButton(
                            child: Text(buttonOkText),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(vertical: 0)),
                                backgroundColor: MaterialStateProperty.all(
                                  buttonOkColor ??
                                      Theme.of(context).primaryColor,
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(buttonRadius),
                                  ),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: buttonOkOnPressed as void Function()? ??
                                () {
                                  Navigator.pop(context);
                                },
                          )
                        : TextButton.icon(
                            icon: const Icon(Icons.done),
                            label: Text(buttonOkText),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 0)),
                              backgroundColor:
                                  MaterialStateProperty.all(buttonOkColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(buttonRadius),
                                ),
                              ),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            onPressed: buttonOkOnPressed as void Function()? ??
                                () {
                                  Navigator.pop(context);
                                },
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
