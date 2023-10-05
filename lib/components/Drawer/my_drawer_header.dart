import 'package:awashyak_v1/constants.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: indibg,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            foregroundImage: AssetImage("lib/assets/profile.jpg"),
          )
          ,
          // Container(
          //   margin: EdgeInsets.only(bottom: 10),
          //   height: 70,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //       image: AssetImage('assets/profile.jpg'),
          //     ),
          //   ),
          // ),
          Text(
            "Tanish",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "vctanish7@gmail.com",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
