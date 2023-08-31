import '../../constants.dart';
import '../../screens/chatGPT.dart';
import '../../screens/individual_medicine_screen.dart';
import '../../screens/medicine_search_page.dart';
import '../../screens/shopkeeper/IndividualMedicineShop.dart';
import '../../screens/shopkeeper/shopManager.dart';
import '../../utilities/datamodel.dart';
import '../../utilities/medicineCall.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//to remove to main page
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomePageShop extends StatefulWidget {
  String token;
  String shopid;
  String shopName;
  HomePageShop(
      {super.key,
      required this.token,
      required this.shopid,
      required this.shopName});

  @override
  State<HomePageShop> createState() => _HomePageShopState();
}

class _HomePageShopState extends State<HomePageShop> {
  List<_SalesData> chartData = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  Future<Data> fetch(String medicineName) async {
    var result = await MedicineDataFetch.sendMessage(medicineName);
    if (result == "failed to fetch") {
      return sampleData;
    }
    print(result);
    return result;
  }

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
      backgroundColor: secondaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "AWASHYAK",
          style: TextStyle(
            color: lightColor,
            fontSize: 24,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: const Icon(Icons.exit_to_app),
          )
        ],
        backgroundColor: primaryColor,
      ),
      drawer: const Drawer(backgroundColor: Colors.white),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: screenWidth * 0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  widget.shopName,
                                  style: const TextStyle(
                                    color: lightColor,
                                    fontSize: 30,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ShopManager(
                                          shopid: widget.shopid,
                                          token: widget.token,
                                        ),
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              secondaryColor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              side: const BorderSide(
                                                  color: primaryColor)))),
                                  child: const Text(
                                    "Manage My Shop",
                                    style: TextStyle(color: primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Image(
                          image: const AssetImage('lib/assets/shop.png'),
                          height: screenHeight * 0.25,
                          width: screenWidth * 0.45,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenHeight * 0.03,
                  right: screenHeight * 0.03,
                  bottom: screenHeight * 0.03),
              child: Container(
                decoration: const BoxDecoration(
                  color: homeIndiBg,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                height: screenHeight * 0.2,
                width: screenWidth,
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * 0.02),
                  child: Column(
                    children: [
                      Text(
                        "Medical Analatics -",
                        style: TextStyle(
                          color: buttonColor,
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: SfCircularChart(
                          backgroundColor: homeIndiBg,
                          onDataLabelRender: (DataLabelRenderArgs args) {
                            double value = double.parse(args.text);
                            args.text = value.toStringAsFixed(0);
                          },
                          series: <CircularSeries<_SalesData, String>>[
                            PieSeries<_SalesData, String>(
                                selectionBehavior:
                                    SelectionBehavior(enable: true),
                                explode: true,
                                dataSource: chartData,
                                xValueMapper: (_SalesData sales, _) =>
                                    sales.year,
                                yValueMapper: (_SalesData sales, _) =>
                                    sales.sales,
                                name: 'Sales',
                                dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenHeight * 0.03,
                  right: screenHeight * 0.03,
                  bottom: screenHeight * 0.03),
              child: Container(
                decoration: const BoxDecoration(
                  color: homeIndiBg,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                height: screenHeight * 0.1,
                width: screenWidth,
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Total Availabe stock",
                            style: TextStyle(
                              color: buttonColor,
                              fontSize: screenHeight * 0.017,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "543 Medcines",
                            style: TextStyle(
                              color: buttonColor,
                              fontSize: screenHeight * 0.015,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: screenWidth * 0.005,
                        color: primaryColor,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Total Cost of Stock",
                            style: TextStyle(
                              color: buttonColor,
                              fontSize: screenHeight * 0.017,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "₹ 63,444",
                            style: TextStyle(
                              color: buttonColor,
                              fontSize: screenHeight * 0.015,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
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
                                            IndividualMedicineShop(
                                          name: snapshot.data?.brandName ?? "",
                                          quantity: 0,
                                          time: "",
                                          inStock: false,
                                          token: widget.token,
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
                                            IndividualMedicineShop(
                                          name: snapshot.data?.brandName ?? "",
                                          quantity: 0,
                                          time: "",
                                          inStock: false,
                                          token: widget.token,
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
                                            IndividualMedicineShop(
                                          name: snapshot.data?.brandName ?? "",
                                          quantity: 0,
                                          time: "",
                                          inStock: false,
                                          token: widget.token,
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
          ],
        ),
      ),

      // uncomment the below code to add the chat GPT integreation
      // floatingActionButton: FloatingActionButton(
      //   shape: const BeveledRectangleBorder(
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(10),
      //     ),
      //   ),
      //   backgroundColor: primaryColor,
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const ChatGPT(),
      //       ),
      //     );
      //   },
      //   child: const SizedBox(
      //     child: Icon(Icons.search_outlined),
      //   ),
      // ),
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

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
