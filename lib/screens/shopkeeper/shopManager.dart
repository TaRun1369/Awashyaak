import 'dart:convert';
import 'dart:ui';

import 'package:awashyak_v1/LoadingPages/IndiShop.dart';
import 'package:awashyak_v1/integration/seller.dart';

import '../../constants.dart';
import '../../screens/individual_medicine_screen.dart';
import '../../screens/medicineNotFound.dart';
import '../../screens/searchMedicineCard.dart';
import '../../screens/shopkeeper/IndividualMedicineShop.dart';
import '../../utilities/datamodel.dart';
import '../../utilities/medicineCall.dart';
import 'package:flutter/material.dart';

class ShopManager extends StatefulWidget {
  String token;
  String shopid;

  ShopManager({Key? key, required this.token, required this.shopid})
      : super(key: key);

  @override
  State<ShopManager> createState() => _ShopManagerState();
}

class _ShopManagerState extends State<ShopManager> {
  Future<Data> fetch(String medicineName) async {
    var result = await MedicineDataFetch.sendMessage(medicineName);
    if (result == "failed to fetch") {
      return sampleData;
    }
    return result;
  }

  String searchQuery = "Amoxicillin";

  @override
  final List<MedicineCard> card = [];

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 30.0, bottom: 10),
            child: Text(
              "Manage my stocks",
              style: TextStyle(
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 60,
              child: TextField(
                onChanged: (value) => {
                  searchQuery = value,
                },
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                    onTap: () async {
                      Data res = await fetch(searchQuery);
                      // ignore: use_build_context_synchronously
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: ((context) {
                      //       if (res.brandName == "null") {
                      //         return MedicineNotFound();
                      //       } else {
                      //         return IndividualMedicineShop(
                      //           name: res.brandName ?? "NULL",
                      //           quantity: 0,
                      //           time: "",
                      //           inStock: false,
                      //           token: widget.token,
                      //         );
                      //       }
                      //     }),
                      //   ),
                      // );
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return FutureBuilder(
                              future: getIndiMed(
                                  widget.shopid, res.brandName ?? "NULL"),
                              builder: (context, snapshot1) {
                                if (snapshot1.hasData) {
                                  if (snapshot1.data["name"] == "null") {
                                    return IndividualMedicineShop(
                                      name: res.brandName ?? "NULL",
                                      quantity: 0,
                                      time: "null",
                                      inStock: false,
                                      token: widget.token,
                                    );
                                  }else{return IndividualMedicineShop(
                                    name: snapshot1.data["name"],
                                    quantity: snapshot1.data["Quantity"],
                                    time: snapshot1.data["expiry"],
                                    inStock: true,
                                    token: widget.token,
                                  );}
                                }
                                return const IndiLoading();
                              },
                            );
                          },
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.search_outlined,
                      color: primaryColor,
                    ),
                  ),
                  filled: true,
                  fillColor: secondryColor,
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: primaryColor, width: 3.0),
                  ),
                  hintText: "Search for Medicine here",
                  hintStyle: const TextStyle(color: primaryColor),
                ),
              ),
            ),
          ),
          Flexible(
            child: FutureBuilder(
              future: getMed(widget.shopid, widget.token),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return FutureBuilder(
                                    future: getIndiMed(widget.shopid,
                                        snapshot.data[index].name),
                                    builder: (context, snapshot1) {
                                      if (snapshot1.hasData) {
                                        return IndividualMedicineShop(
                                          name: snapshot1.data["name"],
                                          quantity: snapshot1.data["Quantity"],
                                          time: snapshot1.data["expiry"],
                                          inStock: true,
                                          token: widget.token,
                                        );
                                      }
                                      return const IndiLoading();
                                    },
                                  );
                                },
                              ),
                            );
                          },
                          child: snapshot.data[index]);
                    },
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
