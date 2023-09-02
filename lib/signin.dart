import 'dart:js';
import 'package:edupro/dashboard.dart';
import 'package:edupro/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loginpage extends StatelessWidget {
  Loginpage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> loginUser(BuildContext context, String username, String password) async {
    print('Logging in user...');
    print(username);
    print(password);

    final response = await http.post(
      Uri.parse('http://192.168.56.131:3000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Login successful');
      final jsonResponse = jsonDecode(response.body);
      final user = jsonResponse['user'];
      // Navigasi ke halaman Dashboard
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => Dashboard(user: user)),
      );
    } else {
      print('Login failed');
      // Menampilkan pesan error
      showDialog(
        context: context as BuildContext,
        builder: (BuildContext context) {
          final errorMessage = jsonDecode(response.body)['message'] as String;
          return AlertDialog(
            title: const Text('Failed'),
            content: Text(errorMessage),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(),
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
                  child: TextFormField(
                    controller: emailController,
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
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
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
                      String username = emailController.text;
                      String password = passwordController.text;
                      loginUser(context, username, password);
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
