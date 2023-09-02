import 'package:edupro/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp(String email, String username, String password) async {
    if(password.length < 8){
      return; 
    }

    final response = await http.post(
      Uri.parse('http://192.168.56.131:3000/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String,String>{
        'email': email,
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      print('User registered successfully');
    } else {
      print('Failed to register user');
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

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
                    controller: usernameController,
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
                    controller: emailController,
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
                  child: TextFormField(
                    controller: passwordController,
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
                      String email = emailController.text;
                      String username = usernameController.text;
                      String password = passwordController.text;
                      signUp(email, username, password);
                      Navigator.pop(context);
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
