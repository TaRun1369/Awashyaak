import 'package:awashyak_v1/screens/shopkeeperLogin/signinS.dart';
import 'package:awashyak_v1/screens/shopkeeperLogin/signupS.dart';

import '../../screens/login/signin.dart';
import '../../screens/login/signup.dart';

import '../../constants.dart';
import '../../integration/user.dart';
import 'package:flutter/material.dart';

class StartUpShopkeeper extends StatefulWidget {
  const StartUpShopkeeper({Key? key}) : super(key: key);

  @override
  State<StartUpShopkeeper> createState() => _StartUpShopkeeperState();
}

class _StartUpShopkeeperState extends State<StartUpShopkeeper> {
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
              Container(
                color: Colors.transparent,
                child: Image.asset(
                  "lib/assets/AppLogo.png",
                  height: height * 0.4,
                  width: width * 0.4,
                ),
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return SignInShopkeeper();
                        }),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26,
                    ),
                    height: height * 0.05,
                    width: width * 0.5,
                    //color: Colors.black26,
                    child: const Center(
                        child: Text(
                      "Login",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return SignUpShopkeeper();
                        }),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26,
                    ),
                    height: height * 0.05,
                    width: width * 0.5,
                    //color: Colors.black26,
                    child: const Center(
                        child: Text(
                      "Connect your shop",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              Flexible(
                child: SizedBox(
                  height: height * 0.03,
                ),
              ),
              InkWell(
                onTap: () async {
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Text(
                    "Login as Customer",
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
