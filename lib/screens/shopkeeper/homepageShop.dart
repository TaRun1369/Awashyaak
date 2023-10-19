import 'package:awashyak_v1/screens/shopkeeper/LineChartWidgetState.dart';

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
import 'package:fl_chart/fl_chart.dart';
import '../pagecontroller.dart';

//to remove to main page
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomePageShop extends StatefulWidget {
  String token;
  String shopid;
  String shopName;

  HomePageShop({super.key, required this.token, required this.shopid,required this.shopName});

  @override
  State<HomePageShop> createState() => _HomePageShopState();
}
class MonthlySales {
  final String month;
  final double amount;

  MonthlySales(this.month, this.amount);
}

class _HomePageShopState extends State<HomePageShop> {
  // List<_SalesData> chartData = [
  //   _SalesData('Jan', 35),
  //   _SalesData('Feb', 28),
  //   _SalesData('Mar', 34),
  //   _SalesData('Apr', 32),
  //   _SalesData('May', 40)
  // ];
  final List<MonthlySales> salesData = [
    MonthlySales("Jan", 1800),
    MonthlySales("Feb", 1500),
    MonthlySales("Mar", 2800),
    MonthlySales("Apr", 2000),
    MonthlySales("May", 1600),
    MonthlySales("Jun", 1500),
    MonthlySales("Jul", 2200),
    MonthlySales("Aug", 1900),
    MonthlySales("Sep", 2300),
    MonthlySales("Oct", 2100),
    MonthlySales("Nov", 2800),
    MonthlySales("Dec", 3000),
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
      backgroundColor: secondryColor,
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
            icon: const Icon(Icons.perm_identity_rounded),
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
              padding: EdgeInsets.all(screenHeight * 0.02),
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
                            width: screenWidth * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.shopName,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      color: lightColor,
                                      fontSize: 30,

                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.5),
                                  //added padding
                                  child: ElevatedButton(
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
                                            secondryColor),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(10.0),
                                                side: const BorderSide(
                                                    color: primaryColor))),
                                        minimumSize: MaterialStateProperty.all(Size(screenWidth*0.1, screenHeight*0.06))
                                      //added size to the button
                                    ),
                                    child:  Text(
                                      "Manage My Shop",
                                      style: TextStyle(color: primaryColor,fontSize: screenHeight*0.015,fontWeight:FontWeight.w700),
                                      // changed text size and font style
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: screenHeight*0.002),
                          //added padding to the image
                          child: Image(
                            image: const AssetImage('lib/assets/shop.png'),
                            height: screenHeight * 0.25,
                            width: screenWidth * 0.45,
                          ),
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
                height: screenHeight * 0.3,
                // increased from 0.2 to 0.3
                width: screenWidth,
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * 0.009),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding:EdgeInsets.only(bottom: screenHeight*0.02,top: screenHeight*0.012),
                          child: Text(
                            "Medical Analytics",
                            //typo error
                            //changed to analytics
                            style: TextStyle(
                              color: buttonColor,
                              fontSize: screenHeight * 0.023,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: screenHeight*0.20,
                        width: screenWidth*0.75,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: secondryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))

                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LineChartWidgetState(
                                    salesData: salesData,

                                  )
                              ),
                            );

                          },
                          child: SizedBox(
                            height: screenHeight*0.22,

                            child: Padding(
                              padding: EdgeInsets.all(11.0),
                              child: IgnorePointer(
                                child: LineChart(
                                  LineChartData(
                                    titlesData: FlTitlesData(show: false),
                                    borderData: FlBorderData(show: true),
                                    gridData: FlGridData(show: false),
                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: salesData.map((sales) {
                                          return FlSpot(salesData.indexOf(sales).toDouble(), sales.amount);
                                        }).toList(),
                                        isCurved: true,
                                        color:Colors.blue,
                                        dotData: FlDotData(show: true),
                                        belowBarData: BarAreaData(show: false),
                                      ),
                                    ],
                                    minX: 0,
                                    maxX: 11,
                                    minY: 0,
                                    maxY: 3500,
                                  ),
                                ),
                              ),

                              //   //sized box going out from the container,height can be reduced but will create issues with the pie chart
                              //   height: 184.1,
                              //   //height increased from 120 to 184.1
                              //   child: SfCircularChart(
                              //     backgroundColor: homeIndiBg,
                              //     onDataLabelRender: (DataLabelRenderArgs args) {
                              //       double value = double.parse(args.text);
                              //       args.text = value.toStringAsFixed(0);
                              //     },
                              //     series: <CircularSeries<_SalesData, String>>[
                              //       //one of the data going out from the pie chart , size to be increased a little
                              //       //one pressing pie chart seems to be okay
                              //       //the pie chart should show what data it represents , currently it doesnt give out any idea of its purpose
                              //       PieSeries<_SalesData, String>(
                              //           selectionBehavior:
                              //               SelectionBehavior(enable: true),
                              //           explode: true,
                              //           dataSource: chartData,
                              //           xValueMapper: (_SalesData sales, _) =>
                              //               sales.year,
                              //           yValueMapper: (_SalesData sales, _) =>
                              //               sales.sales,
                              //           name: 'Sales',
                              //           dataLabelSettings: DataLabelSettings(
                              //             isVisible: true,
                              //             textStyle: TextStyle(fontSize: screenHeight*0.024,fontWeight: FontWeight.normal,color: Colors.black)
                              //               // increased the text size in the pie chart
                              //             // made the text color uniform , text in blue was shown in white
                              //           ))
                              //     ],
                              //   ),
                            ),
                          ),
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
                    //Added padding in all three cards on bottom and right side.
                    padding: EdgeInsets.only(left: screenHeight * 0.015,right: screenHeight*0.015,bottom: screenHeight*0.015),
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
                                              name: snapshot.data?.brandName??"",
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
                    padding: EdgeInsets.only(left: screenHeight * 0.015,right: screenHeight*0.015,bottom: screenHeight*0.015),
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
                                              name: snapshot.data?.brandName??"",
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
                    padding: EdgeInsets.only(left: screenHeight * 0.015,right: screenHeight*0.015,bottom: screenHeight*0.015),
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
                                              name: snapshot.data?.brandName??"",
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
