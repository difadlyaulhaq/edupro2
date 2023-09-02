import 'dart:async';
import 'package:edupro/signin.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() { // Corrected method name here
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Loginpage(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,

              children: <TextSpan>[
                TextSpan(
                  text: 'Edu',
                  style: TextStyle(
                    fontFamily: "Changa" ,
                    fontSize: 64,
                    color: Color.fromRGBO(244, 160, 69, 1),
                    decoration: TextDecoration.none
                  ),
                ),
                TextSpan(
                  text: 'Pro',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 64,
                    backgroundColor: Color.fromRGBO(66, 96, 60, 1), // Background color for "Pro"
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}