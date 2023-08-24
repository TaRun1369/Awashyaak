
import "package:http/http.dart" as http;


import 'dart:convert';

import '../../utilities/urls.dart';



Future<String> signUpSeller(String name_,String shopname_, String address_,int mobile_, String email_,String licence_,
    String password_, String cPassword_,Map location_, String placeId_) async {
  try {
    Map<String, String> header = {'Content-Type': "application/json"};
    final body = {
      "name": name_,
      "shopName": shopname_,
      "address":address_,
      "mobile": mobile_,
      "email": email_,
      "licence":licence_,
      "password": password_,
      "cpassword": cPassword_,
      "location":location_,
      "placeId":placeId_,
     };

    var res = await http.post(Uri.parse("$url/SignUp"),
        headers: header, body: jsonEncode(body));

    switch (res.statusCode) {
      case 200:
        return jsonDecode(res.body)["tokens"][0]["token"];
    }
    return res.statusCode.toString();
  } catch (e) {
    return e.toString();
  }
}