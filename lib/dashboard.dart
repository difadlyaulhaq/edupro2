import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat datang \nNada Satya M.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
        toolbarHeight: 200,
        backgroundColor: Color.fromRGBO(66, 96, 60, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset(
                    'assets/garis3.svg',
                  width: 300,
                  height: 300,
                )
            ),
          ],
        ),
      ),
    );
  }
}