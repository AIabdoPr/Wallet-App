import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:storage_database/storage_database.dart';
import 'package:wallet_app/controllers/main.controller.dart';
import 'package:wallet_app/pkgs/response.pkg.dart';
import '../values.dart';

class RequestPkg {
  static StorageDatabase get _storageDatabase =>
      Get.find<MainController>().storageDatabase;

  static Map<String, String> get _headers => {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };

  static String get _token =>
      _storageDatabase.collection("settings").get()["token"] ?? "";

  static String getUrl(String target, {bool auth = true}) {
    return '${Consts.apiUrl}/$target${(auth ? "?token=$_token" : "")}';
  }

  static Future<ResponsePkg<T>> send<T>(String target, String type,
      {bool auth = true, Map? data, bool log = true}) async {
    String token = _token;
    String url = getUrl(target, auth: auth);
    if (log) print("resUrl: $url");
    if (auth && token.isEmpty) {
      return ResponsePkg<T>(false, "Invalid token");
    }
    try {
      http.Response response;
      if (type == "get") {
        response = await http.get(
          Uri.parse(url),
          headers: _headers,
        );
      } else {
        response = await http.post(
          Uri.parse(url),
          body: jsonEncode(data),
          headers: _headers,
        );
      }
      return ResponsePkg.fromHttpResponse(response, log: log);
    } on SocketException {
      return ResponsePkg<T>(false, "No Internt Connection");
    } catch (e) {
      return ResponsePkg<T>(false, 'ExceptionError: ' + e.toString());
    }
  }
}
