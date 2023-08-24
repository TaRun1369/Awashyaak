import 'dart:convert';

import 'package:awashyak_v1/integration/user.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

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
              Stack(children: [
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
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.greenAccent,
                                      size: relHeight / 35,
                                    ),
                                    Text(
                                      ' 1.2 Km',
                                      style: TextStyle(
                                          color: secondryColor,
                                          fontSize: relHeight / 50),
                                    ),
                                    SizedBox(
                                      width: relWidth / 20,
                                    ),
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
                                  ],
                                ),
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
                Positioned(
                  top: 0,
                  left: 220,
                  child: CustomPaint(
                      painter: ParallelogramPainter(Colors.orange),
                      child: Container(
                        alignment: Alignment.topRight,
                        width: relWidth / 3,
                        height: relHeight / 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          '₹ 250',
                          style: TextStyle(
                              color: secondryColor,
                              fontWeight: FontWeight.w500),
                        )),
                      )),
                )
              ]),
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
