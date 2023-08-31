import '../constants.dart';
import '../utilities/datamodel.dart';
import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard({
    required this.expiery,
    required this.name,
    required this.quantity,
    Key? key,
  }) : super(key: key);
  final String name;
  final String expiery;
  final int quantity;
  factory MedicineCard.fromJson(Map<String, dynamic> json) {
    return MedicineCard(
      name: json['name'],
      expiery: json['expiry'],
      quantity: json['Quantity'],
    );
  }

  @override
  Widget build(BuildContext context) {
    double relative = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: relative / 80, horizontal: relative / 40),
      child: Container(
        height: relative / 5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: kPrimaryColor, width: 2),
            color: primaryColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: relative / 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: relative / 100),
                    Text(
                      "Expery detail - $expiery",
                      style: TextStyle(
                        fontSize: relative / 52,
                        color: secondaryColor,
                      ),
                    ),
                    Text(
                      "Quantity - ${quantity.toString()}",
                      style: TextStyle(
                        fontSize: relative / 50,
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: kPrimaryColor, width: 2),
                    color: primaryColor),
                height: relative / 5,
                width: double.infinity,
                child: Image.asset(
                  'lib/assets/med.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
