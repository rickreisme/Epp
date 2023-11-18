// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 74, 29, 109),
      appBar: AppBar(
          backgroundColor: Color(0xFF330E50),
          title: Text(
            "Sobre o App",
            style: TextStyle(
                fontSize: 22,
                fontFamily: 'Varela Round',
              ),
            ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed:() => Navigator.pop(context, false),
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
              children: [
            Container(
              child: Text(
                "Esse é o aplicativo E++, um app pensado para ajudar "
                "os estudantes iniciantes de programação a entenderem melhor "
                "os conceitos, principalmente básicos, utilizando a linguagem C++.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontFamily: 'Varela Round',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
             padding: EdgeInsets.only(
              top: 50,
              left: 50,
              right: 50,
             ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/img/Logo.png"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "2023" "\nE++" "\nDesenvolvido por" "\nRick Reis e Melissa Nascimento" "\nProgramação Para Dispositivos Móveis",
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontFamily: 'Varela Round',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
            )
          ],
        ),
      ),
    );
  }
}