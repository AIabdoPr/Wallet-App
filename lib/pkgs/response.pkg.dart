import 'dart:convert';

import 'package:http/http.dart' as http;

class ResponsePkg<T> {
  final bool success;
  final String message;
  final T? value;
  final String? body;

  ResponsePkg(this.success, this.message, {this.value, this.body});

  static ResponsePkg<T> fromHttpResponse<T>(
    http.Response response, {
    bool log = true,
  }) {
    if (log) print("response body: ${response.body}");
    try {
      Map responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (responseData.containsKey("message") &&
            responseData.containsKey("errors") &&
            responseData['message'] == 'Validator Error') {
          responseData['message'] = responseData['errors'].keys.join("\n");
          responseData.remove("errors");
        }
      } else {
        switch (response.statusCode) {
          case 400:
            responseData["message"] =
                "Error[${response.statusCode}]: Bad request";
            break;
          case 403:
            responseData["message"] =
                "Error[${response.statusCode}]: Unauthorised response";
            break;
          default:
            responseData["message"] =
                "response failed with status: ${response.statusCode}";
        }
      }
      Map values = {};
      for (var key in responseData.keys) {
        if (key != "success" && key != "message") {
          values[key] = responseData[key];
        }
      }
      if (values.isEmpty) {
        return ResponsePkg<T>(
          responseData["success"] ?? false,
          responseData["message"] ?? "",
          body: response.body,
        );
      } else if (values.length == 1) {
        return ResponsePkg(
          responseData["success"] ?? false,
          responseData["message"] ?? "",
          value: values[values.keys.first],
          body: response.body,
        );
      } else {
        return ResponsePkg(
          responseData["success"] ?? false,
          responseData["message"] ?? "",
          value: values as T,
          body: response.body,
        );
      }
    } catch (e) {
      String strBody = response.body.toString();
      String body = strBody.substring(
        0,
        strBody.length < 10 ? strBody.length : 10,
      );
      print("ERROR:" + e.toString());
      print("body: $body...");
      return ResponsePkg(false, "body: $body...", body: response.body);
    }
  }
}
