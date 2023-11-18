// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 80, 53, 91),
          ),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25, left: 10, right: 10),
                child: Row(
                  children: [
                    IconButton(
                      alignment: Alignment.topLeft,
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed:() => Navigator.pop(context, false),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 7),
                      child: Text(
                        "Notificações",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Varela Round',
                            fontSize: 27,
                            fontWeight: FontWeight.w400
                        ),
                          textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                width: 40.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 76, 4, 131),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.amberAccent,
                      size: 100,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 7, right: 7),
                      child: Text(
                        "Parece que você ainda não tem nenhuma notificação!",
                        style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Varela Round',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 7, right: 7, top:7),
                      child: Text(
                        "Quando você receber alguma notificação, ela aparecerá por aqui.",
                        style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Varela Round',
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]
              ),
            )
            ]
            ),
      ),
    );
  }
}