import '../constants.dart';
import '../screens/chatGPT.dart';
import '../screens/individual_medicine_screen.dart';
import '../screens/medicineNotFound.dart';
import '../screens/medicine_search_page.dart';
import '../utilities/datamodel.dart';
import '../utilities/medicineCall.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//to remove to main page
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomePageCustomer extends StatefulWidget {
  final String token;
  const HomePageCustomer({super.key, required this.token});

  @override
  State<HomePageCustomer> createState() => _HomePageCustomerState();
}

class _HomePageCustomerState extends State<HomePageCustomer> {
  Future<Data> fetch(String medicineName) async {
    var result = await MedicineDataFetch.sendMessage(medicineName);
    if (result == "failed to fetch") {
      return sampleData;
    }
    print(result);
    return result;
  }

  String searchQuery = "Amoxicillin";

  int _Page = 0;
  final iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.account_box,
    Icons.brightness_7,
  ];

  late Data medicalFetchedRecord;

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
      drawer:  const Drawer(backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.03),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.25,
                      color: primaryColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   width: screenWidth * 0.3,
                        //   child: const Text(
                        //     "Some random shit here",
                        //     style: TextStyle(
                        //       color: lightColor,
                        //       fontSize: 30,
                        //     ),
                        //   ),
                        // ),
                        Container(
                          height: screenHeight * 0.25,
             
                          child: Center(
                              child: Lottie.asset("lib/assets/homepageAni.json"),
                          ),
                        ),
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  screenHeight * 0.03, 0, screenHeight * 0.03, 0),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              if (res.brandName == "null") {
                                return MedicineNotFound();
                              } else {
                                return IndividualMedicine(
                                  searchmed: searchQuery,
                                  token_: widget.token,

                                  givenDataSet: res,
                                );
                              }
                            }),
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
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.03),
              child: Row(
                children: const [
                  Text(
                    "  Popular Products -",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.35,
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
                                    height: screenHeight * 0.2,
                                    width: screenWidth * 0.35,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              'lib/assets/med.png'),
                                          height: screenHeight * 0.13,
                                        ),
                                        Text(
                                          snapshot.data?.brandName ?? "wad",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 15,
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
                    padding: EdgeInsets.only(left: screenHeight * 0.03),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.35,
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
                                    height: screenHeight * 0.2,
                                    width: screenWidth * 0.35,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              'lib/assets/med.png'),
                                          height: screenHeight * 0.13,
                                        ),
                                        Text(
                                          snapshot.data?.brandName ?? "wad",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 15,
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
                    padding: EdgeInsets.only(left: screenHeight * 0.03),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.35,
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
                                    height: screenHeight * 0.2,
                                    width: screenWidth * 0.35,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: const AssetImage(
                                              'lib/assets/med.png'),
                                          height: screenHeight * 0.13,
                                        ),
                                        Text(
                                          snapshot.data?.brandName ?? "wad",
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 15,
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.03,
                  left: screenWidth * 0.1,
                  bottom: screenHeight * 0.03,
                ),
                child: const Text(
                  "Available Doctors -",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.35,
                          ),
                          SizedBox(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                const Text(
                                  "Dr.Sunay",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "MBBS",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.35,
                          ),
                          SizedBox(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                const Text(
                                  "Dr.Tarun",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "MBBS",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenHeight * 0.03),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Stack(
                        children: [
                          Container(
                            color: homeIndiBg,
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.35,
                          ),
                          SizedBox(
                            height: screenHeight * 0.2,
                            width: screenWidth * 0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                const Text(
                                  "Dr.Pranav",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "MBBS",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: primaryColor,
                                  ),
                                ),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: lightColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatGPT(),
            ),
          );
        },
        child: const SizedBox(
          child: Image(image: AssetImage('lib/assets/AppLogo.png')),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _Page,
        gapLocation: GapLocation.center,
        backgroundColor: primaryColor,
        inactiveColor: lightColor,
        activeColor: lightColor,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _Page = index),
        //other params
      ),
    );
  }
}
