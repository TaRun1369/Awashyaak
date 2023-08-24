import 'dart:developer';

import '../utilities/datamodel.dart';
import '../utilities/medicineCall.dart';
import 'package:flutter/material.dart';

class test1 extends StatefulWidget {
  const test1({super.key});

  @override
  State<test1> createState() => _test1State();
}

String? title = "test ";

class _test1State extends State<test1> {
  Future<void> fetch(var medicineName) async {
    var msg = await MedicineDataFetch.sendMessage(medicineName);
    setState(() {
      title =
          "${msg.brandName??"null"} ${msg.id??"null"} ${msg.genericName??"null"} ${msg.labelerName??"null"} ${msg.activeIngredients??"null"} ${msg.strenght??"null"} ${msg.description??"null"}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title ?? "null"),
          ElevatedButton(
              onPressed: () {
                fetch("advil");
              },
              child: const Text("click here"))
        ],
      ),
    );
  }
}
