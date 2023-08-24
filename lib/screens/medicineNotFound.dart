import 'dart:developer';
import 'dart:ui';

import '../constants.dart';
import '../screens/individual_medicine_screen.dart';
import '../screens/searchMedicineCard.dart';
import '../utilities/datamodel.dart';
import '../utilities/medicineCall.dart';
import 'package:flutter/material.dart';

class MedicineNotFound extends StatelessWidget {
  MedicineNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double relative = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: secondryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: const Text(
          'AWASHYAK',
          style: TextStyle(color: lightColor),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/assets/notFound.png",
            height: 300,
          ),
        ],
      ),
    );
  }
}
