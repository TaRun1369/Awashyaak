import '../constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IndiPage extends StatelessWidget {
  String? name;
  String? cost;
  String? image;
  IndiPage(
      {super.key,
      this.name,
      this.cost,
      this.image,
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: indibg,
      body: Stack(
        children: [
          Image.network(
            image ??
                "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fwhite&psig=AOvVaw0i4DsAfbXSvJxV2ovFyKRx&ust=1671035012769000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCLChnNSA9_sCFQAAAAAdAAAAABAE",
            fit: BoxFit.fitHeight,
            height: 250,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  name ?? "Name not found",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "INR. $cost",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}