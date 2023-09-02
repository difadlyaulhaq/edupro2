import 'package:edupro/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
              child: SvgPicture.asset('assets/garis2.svg')
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 30),
                child: Row(
                  children: [
                    Text(
                      "Register",
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
                      hintText: 'Name',
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
                      hintText: 'Email',
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
                          builder: (context) => Loginpage(),
                        ),
                      );
                    },
                    child: Text(
                      "Already have acount ?",
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

                    },
                    child: Text("REGISTER",
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
            ],
          )
        ],
      ),
    );
  }
}
