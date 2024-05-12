// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    String anoAtual = DateFormat('yyyy').format(DateTime.now());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 74, 29, 109),
      appBar: AppBar(
        backgroundColor: Color(0xFF330E50),
        title: Text(
          "Sobre o E++",
          style: TextStyle(
              fontSize: 22, fontFamily: 'Varela Round', color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "O E++ é um aplicativo pensado para ajudar "
                  "estudantes iniciantes de programação a entenderem melhor "
                  "os conceitos, principalmente básicos, utilizando a linguagem C++.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontFamily: 'Varela Round',
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/img/Logo.png"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "$anoAtual - E++"
                  "\nDesenvolvido por:"
                  "\nRick Reis e Melissa Nascimento",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontFamily: 'Varela Round',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
