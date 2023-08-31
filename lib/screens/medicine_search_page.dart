import 'dart:ui';

import '../constants.dart';
import '../screens/individual_medicine_screen.dart';
import '../screens/searchMedicineCard.dart';
import '../utilities/datamodel.dart';
import '../utilities/medicineCall.dart';
import 'package:flutter/material.dart';

class MedicineSearchPage extends StatelessWidget {
  Future<Data> fetch(String medicineName) async {
    var result = await MedicineDataFetch.sendMessage(medicineName);
    if (result == "failed to fetch") {
      return sampleData;
    }
    return result;
  }

  final String searchQuery;
  MedicineSearchPage({Key? key, required this.searchQuery}) : super(key: key);

  @override
  final List<MedicineCard> card = [];

  Widget build(BuildContext context) {
    double relative = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: secondaryColor,
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
        children: [
          SizedBox(
            height: relative / 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: relative / 40),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: primaryColor, width: 2),
              ),
              child: TextField(
                onTap: () {},
                controller: TextEditingController(),
                textAlign: TextAlign.left,
                style: TextStyle(color: primaryColor),
                cursorColor: primaryColor,
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  icon: Padding(
                    padding: EdgeInsets.only(left: relative / 100),
                    child: const Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                  ),
                  hintText: "  Find a medicine",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w200,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: FutureBuilder(
              future: fetch(searchQuery),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IndividualMedicine(
                            searchmed: "Synthroid",
                            token_: "awdwad",
                            givenDataSet: snapshot.data,
                          ),
                        ),
                      );
                    },
                    // child: MedicineCard(givenDataSet: snapshot.data!),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
