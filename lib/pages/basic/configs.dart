// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'notifications.dart';
import 'sobre.dart';

class HomePageConfigs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          decoration: BoxDecoration(
            color: Color(0xFF2D2A2A),
          ),
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: ListView(
          children: [
            Container(
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                IconButton(
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed:() => Navigator.pop(context, false),
                ),
              Container(
                child: Text(
                  "Configurações",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Varela Round',
                    fontSize: 27,
                    fontWeight: FontWeight.w400
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: IconButton(
                    color: Color(0xFF5F1796),
                    icon: SizedBox(
                    height: 55,
                    width: 55,
                      child: Icon(
                        Icons.notifications,
                        size: 40,
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
              ),
               ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Container(
                        padding: EdgeInsets.only(left: 1, right: 2),
                        child: Icon(
                            Icons.person,
                            size: 60,
                            color: Color.fromARGB(255, 132, 41, 202),
                        ),
                      ),
                      label: Text(
                          "Minha Conta",
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'Varela Round',
                          ),
                          textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Container(
                      padding: EdgeInsets.only(left: 2),
                      child: Icon(
                          Icons.security,
                          size: 60,
                          color: Color.fromARGB(255, 132, 41, 202),
                      ),
                    ),
                    label: Text(
                        "Segurança",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'Varela Round',
                        ),
                        textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                        Icons.privacy_tip,
                        size: 60,
                        color: Color.fromARGB(255, 132, 41, 202),
                    ),
                    label: Text(
                        "Privacidade e Dados",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'Varela Round',
                        ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                        Icons.volume_up_sharp,
                        size: 60,
                        color: Color.fromARGB(255, 132, 41, 202),
                    ),
                    label: Text(
                        "Sons e Notificações",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'Varela Round',
                        ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                        Icons.color_lens_sharp,
                        size: 60,
                        color: Color.fromARGB(255, 132, 41, 202),
                    ),
                    label: Text(
                        "Aparência",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'Varela Round',
                        ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sobre(),
                        ),
                      );
                    },
                    icon: Icon(
                        Icons.info,
                        size: 60,
                        color: Color.fromARGB(255, 132, 41, 202),
                    ),
                    label: Text(
                        "Sobre",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontFamily: 'Varela Round',
                        ),
                    ),
                  ),
                ],
              ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              /*Container(
                child: Text(
                  "Avaliar o App",
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Varela Round',
                  ),
                  textAlign: TextAlign.center,
                ),
             ),*/
            
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}