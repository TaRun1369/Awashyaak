import 'package:awashyak_v1/integration/seller.dart';
import 'package:awashyak_v1/screens/shopkeeper/homepageShop.dart';


import '../../screens/homepage.dart';

import '../../constants.dart';
import '../../integration/user.dart';
import 'package:flutter/material.dart';

class SignInShopkeeper extends StatelessWidget {
  SignInShopkeeper({Key? key}) : super(key: key);

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.2,
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
                height: height * 0.05,
              ),
              Flexible(
                child: InkWell(
                  onTap: () async {
                    List ret = await signInShopkeeper(
                        emailcontroller.text, passwordcontroller.text);
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
                      "Login",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.3,
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
            ],
          ),
        ),
      ),
    );
  }
}
