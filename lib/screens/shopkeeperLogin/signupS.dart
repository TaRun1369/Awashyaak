import 'package:awashyak_v1/integration/seller.dart';
import 'package:awashyak_v1/screens/login/validity_checks.dart';
import 'package:awashyak_v1/screens/shopkeeperLogin/map.dart';
import 'package:fancy_password_field/fancy_password_field.dart';

import '../../screens/shopkeeper/homepageShop.dart';

import '../../screens/homepage.dart';

import '../../constants.dart';
import '../../integration/user.dart';
import 'package:flutter/material.dart';

class SignUpShopkeeper extends StatelessWidget {
  late String placeID;
  SignUpShopkeeper({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _licenceController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();

  bool validityCheck() {
    SignUpCheck check = SignUpCheck(_passwordController, _cPasswordController,
        _mobileController, _emailController);
    if (check.emptyCheck() &&
        check.mobileCheck() &&
        check.passwordIdentityCheck() &&
        check.emailCheck() &&
        check.multipleEmptyCheck(args: [
          _nameController,
          _shopNameController,
          _addressController,
          _licenceController
        ])) {
      return true;
    } else {
      return false;
    }
  }

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
                    controller: _nameController,
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
                    controller: _shopNameController,
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
                    controller: _addressController,
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
                    controller: _mobileController,
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
                    controller: _emailController,
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
                    controller: _licenceController,
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
                  child: FancyPasswordField(
                    controller: _passwordController,
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
                  child: FancyPasswordField(
                    controller: _cPasswordController,
                    keyboardType: TextInputType.text,
                    hasStrengthIndicator: false,
                    hasValidationRules: false,
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
                    if (validityCheck()) {
                      List ret = await signUpShopkeeper(
                          _nameController.text,
                          _shopNameController.text,
                          _addressController.text,
                          int.parse(_mobileController.text),
                          _licenceController.text,
                          _emailController.text,
                          _passwordController.text,
                          _cPasswordController.text,
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
                    }
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
