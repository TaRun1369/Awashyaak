import 'package:awashyak_v1/screens/login/validity_checks.dart';
import 'package:fancy_password_field/fancy_password_field.dart';

import '../../screens/shopkeeper/homepageShop.dart';

import '../../screens/homepage.dart';

import '../../constants.dart';
import '../../integration/user.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

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
                  height: height * 0.07,
                ),
                Center(
                  child: Text(
                    "AWASHYAK",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: height * 0.045,
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
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondaryColor,
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
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    controller: mobileController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondaryColor,
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
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondaryColor,
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
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: FancyPasswordField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondaryColor,
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
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: FancyPasswordField(
                    controller: cPasswordController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => {},
                    hasStrengthIndicator: false,
                    hasValidationRules: false,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: secondaryColor,
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
                  height: height * 0.1,
                ),
                InkWell(
                  onTap: () async {
                    SignUpCheck check = SignUpCheck(passwordController,
                        cPasswordController, mobileController);
                    if (check.mobileCheck() && check.passwordIdentityCheck()) {
                      String token_ = await signUpCustomer(
                          nameController.text,
                          int.parse(mobileController.text),
                          emailController.text,
                          passwordController.text,
                          cPasswordController.text);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) {
                            return HomePageCustomer(
                              token: token_,
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
                // SizedBox(
                //   height: height * 0.05,
                // ),
                // InkWell(
                //   onTap: () async {
                //     Navigator.pop(context);
                //   },
                //   child: const Center(
                //     child: Text(
                //       "Back to Main Menu",
                //       style: TextStyle(
                //         decoration: TextDecoration.underline,
                //         color: Color.fromARGB(255, 255, 255, 255),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
