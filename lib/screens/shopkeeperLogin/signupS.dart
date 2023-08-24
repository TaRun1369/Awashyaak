import 'package:awashyak_v1/integration/seller.dart';
import 'package:awashyak_v1/screens/shopkeeperLogin/map.dart';

import '../../screens/shopkeeper/homepageShop.dart';

import '../../screens/homepage.dart';

import '../../constants.dart';
import '../../integration/user.dart';
import 'package:flutter/material.dart';

class SignUpShopkeeper extends StatelessWidget {
  late String placeID;
  SignUpShopkeeper({Key? key}) : super(key: key);

  TextEditingController namecontroller = TextEditingController();
  TextEditingController shopnamecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController licencecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController cpasswordcontroller = TextEditingController();

  // name:req.body.name,
  //           shopName:req.body.shopName,
  //           address:req.body.address,
  //           mobile:req.body.mobile,
  //           email:req.body.email,
  //           licence:req.body.licence,
  //           password:req.body.password,
  //           cpassword:req.body.cpassword,
  //           location:{
  //               type:"Point",
  //               coordinates: [parseFloat(req.body.lat),parseFloat(req.body.long)],
  //           },
  //           placeId:req.body.placeId

  @override
  Widget build(BuildContext context) {
    Size size;
    double height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/assets/login.png"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Center(
                  child: Text(
                    "AWASHYAK",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.05,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Center(
                  child: Text(
                    "One stop solution to any EMERGENCY",
                    style: TextStyle(
                      color: primaryColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: height * 0.02,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextField(
                    controller: namecontroller,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: primaryColor, width: 3.0),
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextFormField(
                    controller: shopnamecontroller,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: primaryColor, width: 3.0),
                      ),
                      hintText: "Shop Name",
                      hintStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextFormField(
                    controller: addresscontroller,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: primaryColor, width: 3.0),
                      ),
                      hintText: "address",
                      hintStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextFormField(
                    controller: mobilecontroller,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: primaryColor, width: 3.0),
                      ),
                      hintText: "Mobile",
                      hintStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: primaryColor, width: 3.0),
                      ),
                      hintText: "Email Id",
                      hintStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextFormField(
                    controller: licencecontroller,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: primaryColor, width: 3.0),
                      ),
                      hintText: "licence No",
                      hintStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextFormField(
                    controller: passwordcontroller,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: primaryColor, width: 3.0),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextFormField(
                    controller: cpasswordcontroller,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(color: primaryColor, width: 3.0),
                      ),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(indibg)),
                    onPressed: (() async {
                      final placeId = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return MapScreen();
                          }),
                        ),
                      );
                      placeID = placeId;
                    }),
                    child: const Text("Select the loaction on the map")),
                SizedBox(
                  height: height * 0.1,
                ),
                InkWell(
                  onTap: () async {
                    List ret = await signUpShopkeeper(
                        namecontroller.text,
                        shopnamecontroller.text,
                        addresscontroller.text,
                        int.parse(mobilecontroller.text),
                        licencecontroller.text,
                        emailcontroller.text,
                        passwordcontroller.text,
                        cpasswordcontroller.text,
                        "17.54151",
                        "73.4353",
                        placeID);
                    // print(ret);
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return HomePageShop(
                            shopName: ret[2],
                            shopid: ret[1],
                            token: ret[0],
                          );
                        }),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26,
                    ),
                    height: height * 0.07,
                    width: width * 0.6,
                    //color: Colors.black26,
                    child: const Center(
                        child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: const Center(
                    child: Text(
                      "Back to Main Menu",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
