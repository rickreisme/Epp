// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controller/login_controller.dart';
import '../auth/login.dart';
import '../basic/configs.dart';
import '../basic/notifications.dart';
import '../features/anotacao_page.dart';

class Caderno extends StatelessWidget {

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
                    "Caderno",
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
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Veja aqui as suas anotações e os seus conteúdos salvos",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Varela Round',
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                        MaterialPageRoute(
                        builder: (context) => AnotacaoPage(),
                        ),
                      );
                  },
                  child: Container(
                        width: 200.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 88, 39, 125),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF3A224B),
                              spreadRadius: 2,
                              offset: Offset(-2, 0)
                            )
                          ]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                              child: Icon(Icons.note_alt,
                                color: Color.fromARGB(255, 43, 16, 64),
                                size: 100,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Minhas Anotações",
                                  style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Varela Round',
                                  color: Colors.white
                                  ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )
                   ),
                ),
                 SizedBox(
                  height: 25,
                 ),
                 Container(
                      width: 200.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 88, 39, 125),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF3A224B),
                            spreadRadius: 2,
                            offset: Offset(-2, 0)
                          )
                        ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: 40.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 43, 16, 64),
                                  borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "O que é \num programa?",
                                      style: TextStyle(
                                       fontSize: 12.sp,
                                       fontFamily: 'Varela Round',
                                       color: Colors.white
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: 40.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 43, 16, 64),
                                  borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      "O que é \num algoritmo?",
                                      style: TextStyle(
                                       fontSize: 12.sp,
                                       fontFamily: 'Varela Round',
                                       color: Colors.white
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Container(
                              child: Text(
                                "Lógica e Algoritmo",
                                  style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Varela Round',
                                  color: Colors.white
                                  ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )
                 ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}