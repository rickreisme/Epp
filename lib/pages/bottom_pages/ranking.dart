// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
            Row(
               mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, right: 14),
                  child: FutureBuilder<String>(
                    future: LoginController().usuarioLogado(),
                    builder: (context, snapshot){
                      if(snapshot.connectionState == ConnectionState.done){
                        return Directionality(
                          textDirection: TextDirection.rtl, 
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              textStyle: TextStyle(
                              fontSize: 17.sp,
                              fontFamily: 'Varela Round',
                              color: Color(0xFF5F1796),
                              fontWeight: FontWeight.w600
                            )
                          ),
                          onPressed:() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => Login(),
                              ),
                            );
                            LoginController().logout();
                          },
                          icon: Icon(Icons.exit_to_app, size: 20),
                          label: Text(snapshot.data.toString()),
                          ),
                        );
                      }
                      return Text('');
                    }
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Ranking",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Varela Round',
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w400
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  color: Color(0xFF5F1796),
                  icon: SizedBox(
                  height: 55,
                  width: 55,
                    child: Icon(
                      Icons.notifications,
                      size: 33,
                    ),
                  ),
                  onPressed:() {
                    Navigator.push(
                      context,
                        MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                        ),
                      );
                  }, 
                ),
                IconButton(
                  color: Color(0xFF5F1796),
                  icon: SizedBox(
                    height: 41,
                    width: 41,
                    child: Icon(
                        Icons.settings,
                        size: 33,
                      ),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => HomePageConfigs(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 10,
                ),
              ],
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
                  Container(
                    padding: EdgeInsets.only(left: 3, right: 3),
                    width: 80.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 118, 8, 203),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                            ),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/img/rick1.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 160, top: 10),
                              child: Text(
                                "#1 Você",
                                style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontFamily: 'Varela Round',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 25),
                              child: Text(
                                "Fez 25 pontos nesta semana!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Varela Round',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 3, right: 3),
                    width: 80.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF8E59B6),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 56,
                          height: 56,
                          child: Image.asset("assets/img/julia.png"),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 185, top: 10),
                              child: Text(
                                "Júlia",
                                style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontFamily: 'Varela Round',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Text(
                                "Fez 25 pontos nesta semana!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Varela Round',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 3, right: 3),
                    width: 80.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF8E59B6),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 56,
                          height: 56,
                          child: Image.asset("assets/img/pedro.png"),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 180, top: 10),
                              child: Text(
                                "Pedro",
                                style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontFamily: 'Varela Round',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 15),
                              child: Text(
                                "Fez 20 pontos nesta semana!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Varela Round',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 3, right: 3),
                    width: 80.w,
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: Color(0xFF8E59B6),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 56,
                          height: 56,
                          child: Image.asset("assets/img/pedro.png"),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 160, top: 10),
                              child: Text(
                                "Gabriela",
                                style: TextStyle(
                                  color: Colors.amberAccent,
                                  fontFamily: 'Varela Round',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 16),
                              child: Text(
                                "Fez 15 pontos nesta semana!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Varela Round',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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