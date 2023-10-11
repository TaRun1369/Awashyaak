import 'dart:convert';

import 'package:awashyak_v1/integration/user.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

void openGoogleMaps(double latitude, double longitude) async {
  final String googleMapsUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  // print(latitude);
  // print(longitude);
  if (await canLaunch(googleMapsUrl)) {
    await launch(googleMapsUrl);
  } else {
    throw 'Could not launch Google Maps';
  }
}

void _makePhoneCall(int phoneNumber) async {
  // Replace with the phone number you want to call
  final url = 'tel:${phoneNumber.toString()}';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class MedicalStoresCard extends StatefulWidget {
  final String token_;
  final String medcine_;
  final int value;
  const MedicalStoresCard(
      {Key? key,
      required this.token_,
      required this.value,
      required this.medcine_})
      : super(key: key);

  @override
  State<MedicalStoresCard> createState() => _MedicalStoresCardState();
}

class _MedicalStoresCardState extends State<MedicalStoresCard> {
  @override
  Widget build(BuildContext context) {
    double relHeight = MediaQuery.of(context).size.height;
    double relWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future:
          getMedicines(widget.token_, widget.medcine_, "17.54651", "73.4453"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (widget.value < snapshot.data.length) {
            return Column(children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: relHeight / 80, horizontal: relWidth / 40),
                    child: Container(
                      height: relHeight / 7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: indibg,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: relHeight / 80, left: relWidth / 40),
                              child: Column(
                                children: [
                                  Text(
                                    snapshot.data[widget.value]["shopName"],
                                    style: TextStyle(
                                      color: secondryColor,
                                      fontSize: relHeight / 45,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: relHeight / 50),
                                  Center(
                                    child: Text(
                                      'Rs. 250',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: relHeight / 50),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // ElevatedButton(
                                      //   style: ElevatedButton.styleFrom(
                                      //     primary: Colors.red,
                                      //   ),
                                      //   onPressed: () {
                                      //     openGoogleMaps(18.458478374890056,
                                      //         73.85057610794063); // Replace with your desired latitude and longitude
                                      //   },
                                      //   child: Text('Map'),
                                      // ),
                                      IconButton(
                                          onPressed: () {
                                            openGoogleMaps(18.45780668256702,
                                                73.85070484860245);
                                            // Replace with your desired latitude and longitude
                                          },
                                          icon: Icon(Icons.location_on,
                                              color: Colors.yellow)),
                                      // SizedBox(
                                      // //   width: relWidth / 20,
                                      // ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: relHeight / 35,
                                      ),
                                      Text(
                                        ' 4.6/5',
                                        style: TextStyle(
                                            color: secondryColor,
                                            fontSize: relHeight / 50),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            _makePhoneCall(snapshot
                                                .data[widget.value]["mobile"]);
                                          },
                                          icon: Icon(Icons.phone,
                                              color: Colors.lightGreenAccent)),
                                    ],
                                  ),
                                  // Center(
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(2),
                                  //       color: Colors.orangeAccent),

                                  //   child: Text(
                                  //     'Rs. 250',

                                  //     style: TextStyle(
                                  //         color: Colors.white,
                                  //         fontSize: relHeight / 50),
                                  //   ),
                                  // ),),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: relHeight / 5,
                              width: double.infinity,
                              child: Image.network(
                                'https://www.google.com/maps/uv?pb=!1s0x3bdf30f95db26a09%3A0xca53455198a95fd!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipNfPOjUeVMOhoU7EOLIlxvRsd96rJVT5SNiMWrW%3Dw406-h273-n-k-no!5skapileshwar%20medical%20arthe%20-%20Google%20Search!15sCgIgAQ&imagekey=!1e10!2sAF1QipNfPOjUeVMOhoU7EOLIlxvRsd96rJVT5SNiMWrW&hl=en&sa=X&ved=2ahUKEwi33ujTq-_9AhXZS2wGHZ9TAzkQ7ZgBKAB6BAgXEAI#',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 100,
                  //   left: 220,
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.call,
                  //         color: Colors.green,
                  //         size: relHeight / 35,
                  //       ),
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.green,
                  //         ),
                  //         onPressed: () {
                  //           openGoogleMaps(37.7749,
                  //               -122.4194); // Replace with your desired latitude and longitude
                  //         },
                  //         child: Text('Call'),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ]);
          } else {
            return Container();
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class ParallelogramPainter extends CustomPainter {
  final Color color;

  ParallelogramPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.7, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.3, size.height)
      ..close();

    final paint = Paint()..color = color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ParallelogramPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ParallelogramPainter oldDelegate) => false;
}
