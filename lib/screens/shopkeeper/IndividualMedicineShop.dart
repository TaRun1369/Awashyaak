import 'package:awashyak_v1/integration/seller.dart';

import '../../constants.dart';
import '../../screens/medical_stores_card.dart';
import '../../utilities/datamodel.dart';
import 'package:flutter/material.dart';

class IndividualMedicineShop extends StatefulWidget {
  final String name;
  final int quantity;
  final String time;
  bool inStock;
  final String token;

  IndividualMedicineShop(
      {super.key,
      required this.name,
      required this.quantity,
      required this.time,
      required this.inStock,
      required this.token});

  @override
  State<IndividualMedicineShop> createState() => _IndividualMedicineShopState();
}

class _IndividualMedicineShopState extends State<IndividualMedicineShop> {
  TextEditingController amountController = TextEditingController();
  TextEditingController costController = TextEditingController();
  late int a;

  @override
  void initState() {
    super.initState();
    amountController.text = widget.quantity.toString();
    costController.text = "30";
  }

  void incrementAmount() {
    setState(() {
      a = int.parse(amountController.text);
      a++;
      amountController.text = a.toString();
    });
  }

  void decrementAmount() {
    setState(() {
      if (int.parse(amountController.text) > 0) {
        a = int.parse(amountController.text);
        a--;
        amountController.text = a.toString();
      }
    });
  }

  void incrementCost() {
    setState(() {
      a = int.parse(costController.text);
      a++;
      costController.text = a.toString();
    });
  }

  void decrementCost() {
    setState(() {
      if (int.parse(costController.text) > 0) {
        a = int.parse(costController.text);
        a--;
        costController.text = a.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool task = true;
    double relHeight = MediaQuery.of(context).size.height;
    double relWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: relWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/BG.png"), fit: BoxFit.fill),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: relWidth / 30),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: primaryColor,
                      size: relWidth / 10,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: relWidth / 20, top: relHeight / 40),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    height: relHeight / 4,
                    child: Image.asset(
                      'lib/assets/med.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: relWidth / 10, top: relHeight / 35),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        color: lightColor,
                        fontSize: relWidth / 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: relWidth / 10,
                      top: relHeight / 40,
                      bottom: relHeight / 80),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: relWidth / 10,
                      top: relHeight / 35,
                      bottom: relHeight / 35),
                  child: Text(
                    "Amount of medicine present- ",
                    style: TextStyle(
                        color: lightColor,
                        fontSize: relWidth / 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: relWidth / 10,
                    ),
                    child: Container(
                      height: relHeight / 15,
                      decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: relWidth / 3.5,
                    ),
                    child: Container(
                      height: relHeight / 15,
                      decoration: const BoxDecoration(
                        color: indibg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: TextFormField(
                          cursorColor: Colors.black87,
                          controller: amountController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          onChanged: (value) => {},
                          style: TextStyle(
                              fontSize: relHeight / 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          decoration: InputDecoration(
                            filled: true,
                            border: InputBorder.none,
                            // hintText: widget.quantity.toString(),
                            hintStyle: TextStyle(
                                fontSize: relHeight / 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: relWidth / 1.35,
                      top: relHeight / 90,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            incrementAmount();
                          },
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        size: 40,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: relWidth / 6.5,
                      top: relHeight / 90,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          decrementAmount();
                        });
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 40,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.only(
                      left: relWidth / 10,
                      top: relHeight / 35,
                      bottom: relHeight / 35),
                  child: Text(
                    "Cost of one medicine packet - ",
                    style: TextStyle(
                        color: lightColor,
                        fontSize: relWidth / 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: relWidth / 10,
                    ),
                    child: Container(
                      height: relHeight / 15,
                      decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: relWidth / 3.5,
                    ),
                    child: Container(
                      height: relHeight / 15,
                      decoration: const BoxDecoration(
                        color: indibg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: TextFormField(
                          cursorColor: Colors.black87,
                          controller: costController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          onChanged: (value) => {},
                          style: TextStyle(
                              fontSize: relHeight / 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            // fillColor: Colors.white,
                            // hintText: "30",
                            hintStyle: TextStyle(
                                fontSize: relHeight / 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: relWidth / 1.35,
                      top: relHeight / 90,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            incrementCost();
                          },
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        size: 40,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: relWidth / 6.5,
                      top: relHeight / 90,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          decrementCost();
                        });
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 40,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 40,
                ),
                Visibility(
                  visible:
                      !widget.inStock && (int.parse(amountController.text) > 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          String res = await addMedicine(
                            widget.token,
                            widget.name,
                            widget.time,
                            int.parse(amountController.text),
                            int.parse(costController.text),
                          );
                          if (res == "sucess") {
                            setState(() {
                              widget.inStock = true;
                            });
                          }
                        },
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size>(
                                const Size(200, 60)),
                            backgroundColor:
                                MaterialStateProperty.all(secondaryColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: const BorderSide(
                                        color: primaryColor)))),
                        child: const Text(
                          "Add Medicine",
                          style: TextStyle(color: primaryColor, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.inStock,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size>(
                                const Size(120, 50)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 249, 2, 2)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: const BorderSide(
                                        color: primaryColor)))),
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size>(
                                const Size(120, 50)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 246, 185, 0)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: const BorderSide(
                                        color: primaryColor)))),
                        child: const Text(
                          "Update",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
