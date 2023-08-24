import 'dart:convert';
//import 'dart:ffi';
// import 'dart:html';

import 'package:awashyak_v1/screens/searchMedicineCard.dart';
import "package:http/http.dart" as http;

// enter the url here
// String host = "http://localhost:2700";
String host = "https://inc-backend-awashyak.onrender.com";

Future<dynamic> signUpShopkeeper(
    String name_,
    String shopName_,
    String address_,
    int mobile_,
    String licence_,
    String email_,
    String password_,
    String cPassword_,
    String latitude_,
    String longitude_,
    String placeId_) async {
  try {
    final body = {
      "name": name_,
      "shopName": shopName_,
      "address": address_,
      "mobile": mobile_,
      "email": email_,
      "licence": licence_,
      "password": password_,
      "cpassword": cPassword_,
      "lat": latitude_,
      "long": longitude_,
      "placeId": placeId_
    };
    Map<String, String> header = {'Content-Type': "application/json"};

    var res = await http.post(Uri.parse("$host/Signup"),
        headers: header, body: jsonEncode(body));
    res = await http.post(Uri.parse("$host/login"),
        headers: header,
        body: jsonEncode({"email": email_, "password": password_}));

    // print(res.statusCode);
    switch (res.statusCode) {
      case 200:
        return [
          jsonDecode(res.body)["tokens"][0]["token"],
          jsonDecode(res.body)["_id"],
          jsonDecode(res.body)["shopName"]
        ];
    }
  } catch (e) {
    return e.toString();
  }
}

Future<dynamic> signInShopkeeper(String email_, String password_) async {
  try {
    final body = {
      "email": email_,
      "password": password_,
    };
    Map<String, String> header = {'Content-Type': "application/json"};

    var res = await http.post(Uri.parse("$host/login"),
        headers: header, body: jsonEncode(body));

    switch (res.statusCode) {
      case 200:
        return [
          jsonDecode(res.body)["tokens"][0]["token"],
          jsonDecode(res.body)["_id"],
          jsonDecode(res.body)["shopName"]
        ];
    }
    return res.statusCode.toString();
  } catch (e) {
    return e.toString();
  }
}

Future<String> addMedicine(String token_, String name_, String expiry_,
    int quantity_, int cost_) async {
  try {
    final header = {
      'Content-Type': "application/json",
      "Authorization": token_
    };
    final body = {
      "name": name_,
      "expiry": "12",
      "Quantity": quantity_,
      "Cost": cost_
    };

    var res = await http.post(Uri.parse("$host/AddMed"),
        headers: header, body: jsonEncode(body));
    // print("a");
    switch (res.statusCode) {
      case 200:
        return "sucess";
    }
    return res.statusCode.toString();
  } catch (e) {
    return e.toString();
  }
}

Future<dynamic> getMed(String id_, String token_) async {
  try {
    final header = {
      'Content-Type': "application/json",
      "Authorization": token_
    };

    var res = await http.get(Uri.parse("$host/getMed/$id_"), headers: header);
    switch (res.statusCode) {
      case 200:
        List<dynamic> ret = jsonDecode(res.body);
        List<MedicineCard> medicines =
            ret.map((dynamic item) => MedicineCard.fromJson(item)).toList();

        return medicines;
    }
  } catch (e) {
    throw "Error";
  }
}

Future<dynamic> getIndiMed(String id_, String name_) async {
  try {
    final header = {
      'Content-Type': "application/json",
    };
    var res = await http.get(Uri.parse("$host/searchMyMed/$id_/$name_"),
        headers: header);
    switch (res.statusCode) {
      case 200:
        if (res.body == "") {
          return {"name": "null"};
        }
        return jsonDecode(res.body);
    }
  } catch (e) {
    throw "error";
  }
}
