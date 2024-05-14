// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_string_interpolations

// ignore: unused_import
import 'package:epp/model/mensagem.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// ignore: unused_import
import '../controller/login_controller.dart';
// ignore: unused_import
import '../pages/auth/login.dart';
// ignore: unused_import
import '../pages/basic/configs.dart';
// ignore: unused_import
import '../pages/basic/notifications.dart';

class CustomAppBar extends StatelessWidget {
  final String pageTitle;

  const CustomAppBar({required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          padding: EdgeInsets.only(top: 10),
          color: Color(0xFF5F1796),
          icon: SizedBox(
            height: 55,
            width: 55,
            child: Align(
              alignment: Alignment.center, // Alinha o ícone no centro
              child: Icon(
                Icons.arrow_back,
                size: 33,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Center(
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
          ),
        ),
        IconButton(
          padding: EdgeInsets.only(top: 10),
          color: Color(0xFF5F1796),
          icon: SizedBox(
            height: 55,
            width: 55,
            child: Icon(
              Icons.list,
              size: 33,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
