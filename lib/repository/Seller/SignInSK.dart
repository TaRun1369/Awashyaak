import "package:http/http.dart" as http;


import 'dart:convert';

import '../../utilities/urls.dart';

Future<String> signInSeller(
  String email_,
  String password_,
) async {
  try {
    Map<String, String> header = {'Content-Type': "application/json"};
    final body = {
      "email": email_,
      "password": password_,
    };
    var res =
        await http.post(Uri.parse("$url/login"),headers: header, body: jsonEncode(body));

    switch (res.statusCode) {
      case 200:
        return jsonDecode(res.body)["tokens"][0]["token"];
    }
    return res.statusCode.toString();
  } catch (e) {
    return "Error";
  }
}