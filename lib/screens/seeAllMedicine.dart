import '../constants.dart';
import '../screens/individual_medicine_screen.dart';
import '../utilities/datamodel.dart';
import '../utilities/medicineCall.dart';
import 'package:flutter/material.dart';



class SeeAllMedicine extends StatefulWidget {
  final String token;
  const SeeAllMedicine({super.key,required this.token });

  @override
  State<SeeAllMedicine> createState() => _SeeAllMedicineState();
}

class _SeeAllMedicineState extends State<SeeAllMedicine> {
  Future<Data> fetch(String medicineName) async {
    var result = await MedicineDataFetch.sendMessage(medicineName);
    if (result == "failed to fetch") {
      return sampleData;
    }
    print(result);
    return result;
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: secondryColor,
        appBar: AppBar(
          centerTitle: true,
          title:  const Text(
            "AWASHYAK",
            style: TextStyle(
              color: lightColor,
              fontSize: 24,
            ),
          ),
          actions: <Widget>[IconButton(onPressed: (() => Navigator.pop(context)), icon: const Icon(Icons.exit_to_app),)],
          backgroundColor: primaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            verticalDirection: VerticalDirection.down,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.1,
                    bottom: screenHeight * 0.03,
                  ),
                  child: const Text(
                    "AVAILABLE MEDICINES ",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03, right: screenHeight * 0.03, bottom: screenHeight * 0.015 ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.3,
                            width: screenWidth * 0.94,
                          ),
                          FutureBuilder(
                            future: fetch("Synthroid"),
                            builder: (context, AsyncSnapshot<Data> snapshot) {
                              if (snapshot.hasData) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            IndividualMedicine(
                                              searchmed: "Synthroid",
                                              token_: widget.token,
                                          givenDataSet: snapshot.data,
                                        ),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height: screenHeight * 0.3,
                                    width: screenWidth * 0.94,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: screenHeight * 0.02,
                                        ),
                                        Text(
                                          snapshot.data?.brandName ?? "wad",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data?.strenght ?? "100ml",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: primaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image(
                                                  image: const AssetImage(
                                                      'lib/assets/med0.jpg'),
                                                  height: screenHeight * 0.2,
                                                ),
                                              ]
                                            ),
                                            SizedBox(
                                              width : 1,
                                              height: screenHeight * 0.18,
                                              child: const ColoredBox(color: primaryColor),
                                            ),
                                            SizedBox(
                                              width : screenWidth * 0.05,
                                              height: screenHeight * 0.18,
                                            ),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,

                                              children: [
                                                Container (
                                                    width : screenWidth * 0.35,

                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,

                                                      children: [
                                                        Text(
                                                          snapshot.data?.strenght ?? "\u2022 Bullet...-...Bullet...-...Bullet Text",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data?.strenght ?? "\u2022 Bullet...-...Bullet Text",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data?.strenght ?? "\u2022 Bullet Text",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                      ]
                                                    )
                                                )
                                              ],
                                            )
                                          ]
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                                return const CircularProgressIndicator();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03, top: screenHeight * 0.015, right: screenHeight * 0.03, bottom: screenHeight * 0.015 ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.3,
                            width: screenWidth * 0.94,
                          ),
                          FutureBuilder(
                            future: fetch("Norvasc"),
                            builder: (context, AsyncSnapshot<Data> snapshot) {
                              if (snapshot.hasData) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            IndividualMedicine(
                                              searchmed: "Norvasc",
                                              token_: widget.token,
                                          givenDataSet: snapshot.data,
                                        ),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height: screenHeight * 0.3,
                                    width: screenWidth * 0.94,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: screenHeight * 0.02,
                                        ),
                                        Text(
                                          snapshot.data?.brandName ?? "wad",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data?.strenght ?? "100ml",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: primaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image(
                                                  image: const AssetImage(
                                                      'lib/assets/med.png'),
                                                  height: screenHeight * 0.2,
                                                ),
                                              ]
                                            ),
                                            SizedBox(
                                              width : 1,
                                              height: screenHeight * 0.18,
                                              child: const ColoredBox(color: primaryColor),
                                            ),
                                            SizedBox(
                                              width : screenWidth * 0.05,
                                              height: screenHeight * 0.18,
                                            ),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,

                                              children: [
                                                Container (
                                                    width : screenWidth * 0.35,

                                                    child: Column(

                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,

                                                      children: [
                                                        Text(
                                                          snapshot.data?.strenght ?? "\u2022 Bullet...-...Bullet...-...Bullet Text",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data?.strenght ?? "\u2022 Bullet...-...Bullet Text",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data?.strenght ?? "\u2022 Bullet Text",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                      ]
                                                    )
                                                )
                                              ],
                                            )
                                          ]
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                                return const CircularProgressIndicator();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03, top: screenHeight * 0.015, right: screenHeight * 0.03, bottom: screenHeight * 0.015 ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.3,
                            width: screenWidth * 0.94,
                          ),
                          FutureBuilder(
                            future: fetch("Amoxicillin"),
                            builder: (context, AsyncSnapshot<Data> snapshot) {
                              if (snapshot.hasData) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            IndividualMedicine(
                                              searchmed: "Amoxicillin",
                                              token_: widget.token,
                                          givenDataSet: snapshot.data,
                                        ),
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    height: screenHeight * 0.3,
                                    width: screenWidth * 0.94,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: screenHeight * 0.02,
                                        ),
                                        Text(
                                          snapshot.data?.brandName ?? "wad",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data?.strenght ?? "100ml",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: primaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Image(
                                                  image: const AssetImage(
                                                      'lib/assets/med.png'),
                                                  height: screenHeight * 0.2,
                                                ),
                                              ]
                                            ),
                                            SizedBox(
                                              width : 1,
                                              height: screenHeight * 0.18,
                                              child: const ColoredBox(color: primaryColor),
                                            ),
                                            SizedBox(
                                              width : screenWidth * 0.05,
                                              height: screenHeight * 0.18,
                                            ),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,

                                              children: [
                                                Container (
                                                    width : screenWidth * 0.35,

                                                    child: Column(

                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,

                                                      children: [
                                                        Text(
                                                          snapshot.data?.strenght ?? "\u2022 Bullet...-...Bullet...-...Bullet Text",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data?.strenght ?? "\u2022 Bullet...-...Bullet Text",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data?.strenght ?? "\u2022 Bullet Text",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                      ]
                                                    )
                                                )
                                              ],
                                            )
                                          ]
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                                return const CircularProgressIndicator();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ],
          ),
        ),
    );
  }
}




