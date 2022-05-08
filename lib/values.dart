import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Consts/ui_theme.mode.dart';
import 'controllers/main.controller.dart';

class Consts {
  static const String appName = "Wallet App";
  static const String fontFamily = "DMSans";
  static const String serverIP = "41.105.173.4";
  static const String serverPort = "5000";
  static const String serverUrl = "http://$serverIP:$serverPort";
  static const String apiUrl = "$serverUrl/api";
  static const String authUrl = "$apiUrl/auth";
}

class UIColors {
  static const Color primary = Color(0xFF23C1D6);
  static const Color primary1 = Color(0xFF1DA3D8);
  static const Color success = Color(0xFF1CC996);
  static const Color danger = Color(0xFFF7594D);
  static const Color grey = Color(0xB16B6B6B);
}

class UILightColors {
  static const Color bg = Color(0xFFEBE9E9);
  // static const Color accent = Color(0xFF0595A8);
  static const Color accent = Color.fromARGB(255, 1, 123, 139);
  static const Color text = Color.fromARGB(255, 54, 54, 54);
  static const Color text1 = Color.fromARGB(255, 75, 75, 75);
  static const Color selectedItem = Color.fromRGBO(32, 182, 202, 1);
  static const Color inSelectedItem = Color.fromARGB(255, 126, 204, 214);
  static const Color icon = Color.fromARGB(255, 243, 243, 243);
  static const Color iconBg = Color(0xFF283C53);
  static const Color field = Color.fromARGB(143, 117, 117, 117);
  static const Color fieldBg = Color.fromARGB(24, 121, 121, 121);
  static const Color fieldText = Color.fromARGB(255, 66, 66, 66);
  static const Color fieldFocus = Color.fromARGB(141, 35, 193, 214);
}

class UIDarkColors {
  static const Color bg = Color(0xFF283C53);
  static const Color accent = Color(0xFF2D4561);
  static const Color text = Colors.white;
  static const Color text1 = Color.fromARGB(206, 238, 238, 238);
  static const Color selectedItem = Color.fromARGB(255, 0, 203, 230);
  static const Color inSelectedItem = Color.fromARGB(255, 120, 164, 170);
  static const Color icon = bg;
  static const Color iconBg = Color.fromARGB(255, 243, 243, 243);
  static const Color field = Color(0x8FFFFFFF);
  static const Color fieldBg = Color(0x1DFFFFFF);
  static const Color fieldText = Color.fromARGB(255, 235, 235, 235);
  static const Color fieldFocus = Color.fromARGB(141, 35, 193, 214);
}

class UIThemeColors {
  static Color _getColor(String name) {
    Map _colors = {
      UIThemeMode.light.mode: {
        "bg": UILightColors.bg,
        "accent": UILightColors.accent,
        "text": UILightColors.text,
        "text1": UILightColors.text1,
        "selectedItem": UILightColors.selectedItem,
        "inSelectedItem": UILightColors.inSelectedItem,
        "icon": UILightColors.icon,
        "iconBg": UILightColors.iconBg,
        "field": UILightColors.field,
        "fieldBg": UILightColors.fieldBg,
        "fieldText": UILightColors.fieldText,
        "fieldFocus": UILightColors.fieldFocus,
      },
      UIThemeMode.dark.mode: {
        "bg": UIDarkColors.bg,
        "accent": UIDarkColors.accent,
        "text": UIDarkColors.text,
        "text1": UIDarkColors.text1,
        "selectedItem": UIDarkColors.selectedItem,
        "inSelectedItem": UIDarkColors.inSelectedItem,
        "icon": UIDarkColors.icon,
        "iconBg": UIDarkColors.iconBg,
        "field": UIDarkColors.field,
        "fieldBg": UIDarkColors.fieldBg,
        "fieldText": UIDarkColors.fieldText,
        "fieldFocus": UIDarkColors.fieldFocus,
      },
    };
    String mode = Get.find<MainController>().themeMode.value.mode;
    mode = ["Dark", "Light"].contains(mode) ? mode : "Light";
    return _colors[mode]![name]!;
  }

  static Color get bg => _getColor("bg");
  static Color get accent => _getColor("accent");
  static Color get text => _getColor("text");
  static Color get text1 => _getColor("text1");
  static Color get selectedItem => _getColor("selectedItem");
  static Color get inSelectedItem => _getColor("inSelectedItem");
  static Color get icon => _getColor("icon");
  static Color get iconBg => _getColor("iconBg");
  static Color get field => _getColor("field");
  static Color get fieldBg => _getColor("fieldBg");
  static Color get fieldText => _getColor("fieldText");
  static Color get fieldFocus => _getColor("fieldFocus");
}

class UIIcons {
  static const String fontFamily = 'IconlyBold';

  static const IconData activityBold = IconData(0xe900, fontFamily: fontFamily);
  static const IconData userBold = IconData(0xe901, fontFamily: fontFamily);
  static const IconData user1Bold = IconData(0xe902, fontFamily: fontFamily);
  static const IconData addUserBold = IconData(0xe903, fontFamily: fontFamily);
  static const IconData arrowDown2Bold =
      IconData(0xe904, fontFamily: fontFamily);
  static const IconData arrowDown3Bold =
      IconData(0xe905, fontFamily: fontFamily);
  static const IconData arrowDownCircle =
      IconData(0xe906, fontFamily: fontFamily);
  static const IconData arrowDownSquare =
      IconData(0xe907, fontFamily: fontFamily);
  static const IconData arrowDownBold =
      IconData(0xe908, fontFamily: fontFamily);
  static const IconData arrowLeft2Bold =
      IconData(0xe909, fontFamily: fontFamily);
  static const IconData arrowLeft3Bold =
      IconData(0xe90a, fontFamily: fontFamily);
  static const IconData arrowLeftCircle =
      IconData(0xe90b, fontFamily: fontFamily);
  static const IconData arrowLeftSquare =
      IconData(0xe90c, fontFamily: fontFamily);
  static const IconData arrowLeftBold =
      IconData(0xe90d, fontFamily: fontFamily);
  static const IconData arrowRight2Bold =
      IconData(0xe90e, fontFamily: fontFamily);
  static const IconData arrowRight3Bold =
      IconData(0xe90f, fontFamily: fontFamily);
  static const IconData arrowRightCircle =
      IconData(0xe910, fontFamily: fontFamily);
  static const IconData arrowRightSquare =
      IconData(0xe911, fontFamily: fontFamily);
  static const IconData arrowRightBold =
      IconData(0xe912, fontFamily: fontFamily);
  static const IconData arrowUp2Bold = IconData(0xe913, fontFamily: fontFamily);
  static const IconData arrowUp3Bold = IconData(0xe914, fontFamily: fontFamily);
  static const IconData arrowUpCircle =
      IconData(0xe915, fontFamily: fontFamily);
  static const IconData arrowUpSquare =
      IconData(0xe916, fontFamily: fontFamily);
  static const IconData arrowUpBold = IconData(0xe917, fontFamily: fontFamily);
  static const IconData bag2Bold = IconData(0xe918, fontFamily: fontFamily);
  static const IconData bagBold = IconData(0xe919, fontFamily: fontFamily);
  static const IconData bookmarkBold = IconData(0xe91a, fontFamily: fontFamily);
  static const IconData buyBold = IconData(0xe91b, fontFamily: fontFamily);
  static const IconData calendarBold = IconData(0xe91c, fontFamily: fontFamily);
  static const IconData callMissedBold =
      IconData(0xe91d, fontFamily: fontFamily);
  static const IconData callSilentBold =
      IconData(0xe91e, fontFamily: fontFamily);
  static const IconData callBold = IconData(0xe91f, fontFamily: fontFamily);
  static const IconData callingBold = IconData(0xe920, fontFamily: fontFamily);
  static const IconData cameraBold = IconData(0xe921, fontFamily: fontFamily);
  static const IconData categoryBold = IconData(0xe922, fontFamily: fontFamily);
  static const IconData chartBold = IconData(0xe923, fontFamily: fontFamily);
  static const IconData chatBold = IconData(0xe924, fontFamily: fontFamily);
  static const IconData closeSquareBold =
      IconData(0xe925, fontFamily: fontFamily);
  static const IconData dangerBold = IconData(0xe926, fontFamily: fontFamily);
  static const IconData deleteBold = IconData(0xe927, fontFamily: fontFamily);
  static const IconData discountBold = IconData(0xe928, fontFamily: fontFamily);
  static const IconData discoveryBold =
      IconData(0xe929, fontFamily: fontFamily);
  static const IconData documentBold = IconData(0xe92a, fontFamily: fontFamily);
  static const IconData downloadBold = IconData(0xe92b, fontFamily: fontFamily);
  static const IconData editSquareBold =
      IconData(0xe92c, fontFamily: fontFamily);
  static const IconData editBold = IconData(0xe92d, fontFamily: fontFamily);
  static const IconData filter2Bold = IconData(0xe92e, fontFamily: fontFamily);
  static const IconData filterBold = IconData(0xe92f, fontFamily: fontFamily);
  static const IconData folderBold = IconData(0xe930, fontFamily: fontFamily);
  static const IconData gameBold = IconData(0xe931, fontFamily: fontFamily);
  static const IconData graphBold = IconData(0xe932, fontFamily: fontFamily);
  static const IconData heartBold = IconData(0xe933, fontFamily: fontFamily);
  static const IconData hideBold = IconData(0xe934, fontFamily: fontFamily);
  static const IconData homeBold = IconData(0xe935, fontFamily: fontFamily);
  static const IconData image2Bold = IconData(0xe936, fontFamily: fontFamily);
  static const IconData imageBold = IconData(0xe937, fontFamily: fontFamily);
  static const IconData infoCircleBold =
      IconData(0xe938, fontFamily: fontFamily);
  static const IconData infoSquareBold =
      IconData(0xe939, fontFamily: fontFamily);
  static const IconData locationBold = IconData(0xe93a, fontFamily: fontFamily);
  static const IconData lockBold = IconData(0xe93b, fontFamily: fontFamily);
  static const IconData loginBold = IconData(0xe93c, fontFamily: fontFamily);
  static const IconData logoutBold = IconData(0xe93d, fontFamily: fontFamily);
  static const IconData messageBold = IconData(0xe93e, fontFamily: fontFamily);
  static const IconData moreCircleBold =
      IconData(0xe93f, fontFamily: fontFamily);
  static const IconData moreSquareBold =
      IconData(0xe940, fontFamily: fontFamily);
  static const IconData notificationBold =
      IconData(0xe941, fontFamily: fontFamily);
  static const IconData paperDownload =
      IconData(0xe942, fontFamily: fontFamily);
  static const IconData paperFailBold =
      IconData(0xe943, fontFamily: fontFamily);
  static const IconData paperNegative =
      IconData(0xe944, fontFamily: fontFamily);
  static const IconData paperPlusBold =
      IconData(0xe945, fontFamily: fontFamily);
  static const IconData paperUploadBold =
      IconData(0xe946, fontFamily: fontFamily);
  static const IconData paperBold = IconData(0xe947, fontFamily: fontFamily);
  static const IconData passwordBold = IconData(0xe948, fontFamily: fontFamily);
  static const IconData playBold = IconData(0xe949, fontFamily: fontFamily);
  static const IconData plusBold = IconData(0xe94a, fontFamily: fontFamily);
  static const IconData profileBold = IconData(0xe94b, fontFamily: fontFamily);
  static const IconData scanBold = IconData(0xe94c, fontFamily: fontFamily);
  static const IconData searchBold = IconData(0xe94d, fontFamily: fontFamily);
  static const IconData sendBold = IconData(0xe94e, fontFamily: fontFamily);
  static const IconData settingBold = IconData(0xe94f, fontFamily: fontFamily);
  static const IconData shieldDoneBold =
      IconData(0xe950, fontFamily: fontFamily);
  static const IconData shieldFailBold =
      IconData(0xe951, fontFamily: fontFamily);
  static const IconData showBold = IconData(0xe952, fontFamily: fontFamily);
  static const IconData starBold = IconData(0xe953, fontFamily: fontFamily);
  static const IconData swapBold = IconData(0xe954, fontFamily: fontFamily);
  static const IconData tickSquareBold =
      IconData(0xe955, fontFamily: fontFamily);
  static const IconData ticketStarBold =
      IconData(0xe956, fontFamily: fontFamily);
  static const IconData ticketBold = IconData(0xe957, fontFamily: fontFamily);
  static const IconData timeCircleBold =
      IconData(0xe958, fontFamily: fontFamily);
  static const IconData timeSquareBold =
      IconData(0xe959, fontFamily: fontFamily);
  static const IconData unlockBold = IconData(0xe95a, fontFamily: fontFamily);
  static const IconData uploadBold = IconData(0xe95b, fontFamily: fontFamily);
  static const IconData videoBold = IconData(0xe95c, fontFamily: fontFamily);
  static const IconData voice2Bold = IconData(0xe95d, fontFamily: fontFamily);
  static const IconData voiceBold = IconData(0xe95e, fontFamily: fontFamily);
  static const IconData volumeDownBold =
      IconData(0xe95f, fontFamily: fontFamily);
  static const IconData volumeOffBold =
      IconData(0xe960, fontFamily: fontFamily);
  static const IconData volumeUpBold = IconData(0xe961, fontFamily: fontFamily);
  static const IconData walletBold = IconData(0xe962, fontFamily: fontFamily);
  static const IconData workBold = IconData(0xe963, fontFamily: fontFamily);
}
