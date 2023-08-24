import 'package:flutter/material.dart';

class IndiLoading extends StatelessWidget {
  const IndiLoading({super.key});

  @override
  Widget build(BuildContext context) {
    double relWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: relWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/BG.png"), fit: BoxFit.fill),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
