import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Constants/url.dart';
import '../Widget/error.dart';

getApi(BuildContext context, String endPoint) async {
  try {
    Uri url = Uri.parse(baseUri + endPoint);
    http.Response resp = await http.get(url);
    print('code : '+resp.statusCode.toString());
    if (resp.statusCode == 200) {
      if (resp.body.isNotEmpty) {
        return jsonDecode(resp.body);
      }
      return "Error";
    }
   else {
      showErrorDialog(context, "Error 2", resp.body, "OK");
    }
  } catch (e) {
    showErrorDialog(context, "Error 3", "Code : $e", "OK");
    if (kDebugMode) {
      print('Code : $e');
    }
    return "Error";
  }
}
