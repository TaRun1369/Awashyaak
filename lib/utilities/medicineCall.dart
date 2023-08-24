import 'dart:convert';
import 'dart:io';

import '../utilities/datamodel.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

String apiKey = "ef1b08e122msh6f06b3a0bfe082bp125d8djsnb0092eeb7ba8";

class MedicineDataFetch {

  static Map<String, String> header = {
    'Accept' : '*/*',
    'User-Agent':'Thunder Client (https://www.thunderclient.com)',
    'X-RapidAPI-Key': apiKey,
    'X-RapidAPI-Host': 'drug-info-and-price-history.p.rapidapi.com',
  };

  static sendMessage(String? message) async {
    var res = await http.get(
      Uri.parse(
          "https://drug-info-and-price-history.p.rapidapi.com/1/druginfo?drug=$message"),
      headers: header,
    );

    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      var result = Data.fromJson(data[0]);
      return result;
    } else {
      return ("failed to fetch");
    }
  }
}
