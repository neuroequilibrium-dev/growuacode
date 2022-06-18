import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

postApi(BuildContext context, String endPoint, var body, {String? encryptionKey, bool auth = true}) async {
  try {
   // Uri url = Uri.parse(renApiBaseUri + endPoint);
  //  Provider_user user = Provider.of<Provider_user>(context, listen: false);
    String userToken = user.userToken;
    String ekey = encryptionKey ?? user.encryptionKey;
    Map<String, String> reqHeaders = <String, String>{
      'Content-Type': 'text/plain',
      if (auth) 'Authorization': userToken,
    };
   // String encryptedJsonBody = RenEncrypt.encrypt(jsonEncode(body), ekey);
    http.Response resp = await http.post(url, headers: reqHeaders, body: encryptedJsonBody);
    if (kDebugMode) {
      print('<POST API> |[${(endPoint + ']').padRight(30, ' ')}: ${resp.body}\n${'_' * 40}');
    }
    if (resp.statusCode == 200) {
      if (resp.body.isNotEmpty) {
        String resBody = RenEncrypt.decrypt(resp.body, ekey);
        return jsonDecode(resBody);
      }
      return "Error";
    }
    if (jsonDecode(resp.body)['Status'] == 'false') {
      showErrorDialog(context, "Error", jsonDecode(resp.body)['Msg'].toString(), "OK");
    } else {
      showErrorDialog(context, "Error", resp.body, "OK");
    }
    return "Error";
  } catch (e) {
    showErrorDialog(context, "Error", "Code : $e", "OK");
    if (kDebugMode) {
      print('Code : $e');
    }
    return "Error";
  }
}
