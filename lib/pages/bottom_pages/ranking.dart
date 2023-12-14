// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../components/app_bar.dart';
import '../../components/student_card.dart';
import '../../components/student_card2.dart';
import '../../controller/login_controller.dart';
import '../auth/login.dart';
import '../basic/configs.dart';
import '../basic/notifications.dart';

class Ranking extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: ListView(
          children: [
            CustomAppBar(
              userNameFuture: LoginController().usuarioLogado(),
              pageTitle: "Ranking",
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 40.w,
              height: 90.h,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 80, 53, 91),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Icon(
                      Icons.equalizer,
                      color: Colors.amberAccent,
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 3, right: 3),
                    child: Text(
                      "Confira a sua posição no ranking dessa semana!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Varela Round',
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      PlayerCard(
                        imagePath: 'assets/img/rick1.png',
                        playerName: 'Você',
                        points: 25,
                        position: '#1',
                      ),
                      SizedBox(height: 20,),
                      PlayerCard2(
                        imagePath: 'assets/img/julia.png',
                        playerName: 'Júlia',
                        points: 23,
                        position: '#2',
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Icon(
                      Icons.group,
                      color: Colors.amberAccent,
                      size: 80,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 1, left: 7, right: 7),
                    child: Text(
                      "Adicione mais colegas para ver mais pessoas no ranking!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Varela Round',
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500
                       ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}