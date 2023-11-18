// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:epp_firebase/controller/login_controller.dart';
import 'package:epp_firebase/pages/auth/login.dart';
import 'package:epp_firebase/pages/basic/configs.dart';
import 'package:epp_firebase/pages/basic/notifications.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  final Future<String> userNameFuture;
  final String pageTitle;

  CustomAppBar({required this.userNameFuture, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: FutureBuilder<String>(
            future: userNameFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: 'Varela Round',
                        color: Color(0xFF5F1796),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                      // Assuming logout method is available in LoginController
                      LoginController().logout();
                    },
                    icon: Icon(Icons.exit_to_app, size: 20),
                    label: Text(snapshot.data.toString()),
                  ),
                );
              }
              return Text('');
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            pageTitle,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Varela Round',
              fontSize: 19.sp,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              padding: EdgeInsets.only(top: 10),
              color: Color(0xFF5F1796),
              icon: SizedBox(
                height: 55,
                width: 55,
                child: Icon(
                  Icons.notifications,
                  size: 33,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(),
                  ),
                );
              },
            ),
            IconButton(
              padding: EdgeInsets.only(top: 10),
              color: Color(0xFF5F1796),
              icon: SizedBox(
                height: 41,
                width: 41,
                child: Icon(
                  Icons.settings,
                  size: 33,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageConfigs(),
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
