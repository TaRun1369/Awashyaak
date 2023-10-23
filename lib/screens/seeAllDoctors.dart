import '../constants.dart';
import '../utilities/datamodel.dart';
import '../utilities/medicineCall.dart';
import 'package:flutter/material.dart';



class SeeAllDoctor extends StatefulWidget {
  final String token;
  const SeeAllDoctor({super.key,required this.token });

  @override
  State<SeeAllDoctor> createState() => _SeeAllDoctorState();
}

class _SeeAllDoctorState extends State<SeeAllDoctor> {
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
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.1,
                    bottom: screenHeight * 0.03,
                  ),
                  child: const Text(
                    "AVAILABLE DOCTORS -",
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
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.94,
                          ),
                          SizedBox(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.94,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width : screenWidth * 0.05,
                                    height: screenHeight * 0.2,
                                  ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(80)),
                                        child: Image(
                                          image:
                                            const AssetImage('lib/assets/doc.png'),
                                          height: screenHeight * 0.1,
                                        ),
                                      ),
                                    ),
                                  ]
                                ),
                                SizedBox(
                                    width : screenWidth * 0.05,
                                    height: screenHeight * 0.2,
                                  ),
                                SizedBox(
                                  width : 1,
                                  height: screenHeight * 0.15,
                                  child: const ColoredBox(color: primaryColor),
                                ),
                                SizedBox(
                                  width : screenWidth * 0.05,
                                  height: screenHeight * 0.2,
                                ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,

                                              children: [
                                                Container (
                                                    width : screenWidth * 0.5,

                                                    child: const Column(

                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,

                                                      children: [
                                                        Text(
                                                          "Dr. Sunay",
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: primaryColor,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          "MBBS",
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          "\u2022 Bullet...-...Bullet Text",
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          "\u2022 Bullet...-...Bullet Text",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          "\u2022 Bullet...-...Bullet Text",
                                                          maxLines: 3,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                      ]
                                                    )
                                                )
                                              ],
                                            )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03, right: screenHeight * 0.03, bottom: screenHeight * 0.015 ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.94,
                          ),
                          SizedBox(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.94,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width : screenWidth * 0.05,
                                    height: screenHeight * 0.2,
                                  ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(80)),
                                        child: Image(
                                          image:
                                            const AssetImage('lib/assets/doc.png'),
                                          height: screenHeight * 0.1,
                                        ),
                                      ),
                                    ),
                                  ]
                                ),
                                SizedBox(
                                    width : screenWidth * 0.05,
                                    height: screenHeight * 0.2,
                                  ),
                                SizedBox(
                                  width : 1,
                                  height: screenHeight * 0.15,
                                  child: const ColoredBox(color: primaryColor),
                                ),
                                SizedBox(
                                  width : screenWidth * 0.05,
                                  height: screenHeight * 0.2,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [
                                    Container (
                                        width : screenWidth * 0.5,
                                        child: const Column(

                                             mainAxisAlignment: MainAxisAlignment.center,
                                             crossAxisAlignment: CrossAxisAlignment.start,

                                             children: [
                                               Text(
                                                 "Dr. Tarun",
                                                 maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 20,
                                                   color: primaryColor,
                                                   fontWeight: FontWeight.bold,
                                                 ),
                                               ),
                                               Text(
                                                 "MBBS",
                                                 maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                               Text(
                                                 "\u2022 Bullet...-...Bullet Text",
                                                 maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                               Text(
                                                 "\u2022 Bullet...-...Bullet Text",
                                                 maxLines: 3,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                               Text(
                                                 "\u2022 Bullet...-...Bullet Text",
                                                 maxLines: 3,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                             ]
                                         )
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03, right: screenHeight * 0.03, bottom: screenHeight * 0.015 ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.94,
                          ),
                          SizedBox(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.94,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width : screenWidth * 0.05,
                                    height: screenHeight * 0.2,
                                  ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(80)),
                                        child: Image(
                                          image:
                                            const AssetImage('lib/assets/doc.png'),
                                          height: screenHeight * 0.1,
                                        ),
                                      ),
                                    ),
                                  ]
                                ),
                                SizedBox(
                                    width : screenWidth * 0.05,
                                    height: screenHeight * 0.2,
                                  ),
                                SizedBox(
                                  width : 1,
                                  height: screenHeight * 0.15,
                                  child: const ColoredBox(color: primaryColor),
                                ),
                                SizedBox(
                                  width : screenWidth * 0.05,
                                  height: screenHeight * 0.2,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [
                                    Container (
                                        width : screenWidth * 0.5,
                                        child: const Column(

                                             mainAxisAlignment: MainAxisAlignment.center,
                                             crossAxisAlignment: CrossAxisAlignment.start,

                                             children: [
                                               Text(
                                                 "Dr. Pranav",
                                                 maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 20,
                                                   color: primaryColor,
                                                   fontWeight: FontWeight.bold,
                                                 ),
                                               ),
                                               Text(
                                                 "MBBS",
                                                 maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                               Text(
                                                 "\u2022 Bullet...-...Bullet Text",
                                                 maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                               Text(
                                                 "\u2022 Bullet...-...Bullet Text",
                                                 maxLines: 3,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                               Text(
                                                 "\u2022 Bullet...-...Bullet Text",
                                                 maxLines: 3,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                             ]
                                         )
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03, right: screenHeight * 0.03, bottom: screenHeight * 0.015 ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.94,
                          ),
                          SizedBox(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.94,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width : screenWidth * 0.05,
                                    height: screenHeight * 0.2,
                                  ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(80)),
                                        child: Image(
                                          image:
                                            const AssetImage('lib/assets/doc.png'),
                                          height: screenHeight * 0.1,
                                        ),
                                      ),
                                    ),
                                  ]
                                ),
                                SizedBox(
                                    width : screenWidth * 0.05,
                                    height: screenHeight * 0.2,
                                  ),
                                SizedBox(
                                  width : 1,
                                  height: screenHeight * 0.15,
                                  child: const ColoredBox(color: primaryColor),
                                ),
                                SizedBox(
                                  width : screenWidth * 0.05,
                                  height: screenHeight * 0.2,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                  children: [
                                    Container (
                                        width : screenWidth * 0.5,
                                        child: const Column(

                                             mainAxisAlignment: MainAxisAlignment.center,
                                             crossAxisAlignment: CrossAxisAlignment.start,

                                             children: [
                                               Text(
                                                 "Dr. Darshan",
                                                 maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 20,
                                                   color: primaryColor,
                                                   fontWeight: FontWeight.bold,
                                                 ),
                                               ),
                                               Text(
                                                 "MBBS",
                                                 maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                               Text(
                                                 "\u2022 Bullet...-...Bullet Text",
                                                 maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                               Text(
                                                 "\u2022 Bullet...-...Bullet Text",
                                                 maxLines: 3,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                               Text(
                                                 "\u2022 Bullet...-...Bullet Text",
                                                 maxLines: 3,
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: TextStyle(
                                                   fontSize: 15,
                                                   color: primaryColor,
                                                 ),
                                               ),
                                             ]
                                         )
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
