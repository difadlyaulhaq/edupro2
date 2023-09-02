import 'package:edupro/dashboard.dart';
import 'package:edupro/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(

          ),
          Positioned(
            right: 0,
            top: 0,
            child: SvgPicture.asset(
              'assets/garis.svg', // Path to your SVG image
               // Adjust the height as needed
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 30),
                child: Row(
                  children: [
                    Text(
                      "Log in",
                      style: TextStyle(
                        fontFamily: "Changa",
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 80, right: 30),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Username/Email',
                      hintStyle: TextStyle(
                        fontFamily: "Changa",
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontFamily: "Changa",
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(45),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
                    },
                    child: Text("Log in",
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(66, 96, 60, 0.6),
                      minimumSize: Size(178, 41),
                    ),
                  ),
                ),
              ),
              Center(

              )
            ],
          ),
        ],
      ),
    );
  }
}
