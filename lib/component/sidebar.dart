import 'package:flutter/material.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: 100,
          height: double.infinity,
          color: Color.fromRGBO(66, 96, 60, 1),
        ),
    );
  }
}
