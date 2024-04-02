import 'package:flutter/material.dart';

class LogicaEAlgoritmoPage extends StatelessWidget {
  const LogicaEAlgoritmoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        // 10% of screen height
        child: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            // 2% of screen height
            child: Text(
              'Lógica e Algoritmo',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Varela Round',
                fontSize: screenWidth * 0.06, // 6% of screen width
              ),
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            // 2% of screen height
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: screenWidth * 0.08, // 8% of screen width
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFF453650),
      ),
    );
  }
}
