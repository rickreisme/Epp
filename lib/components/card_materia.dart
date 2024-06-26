// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MateriaCard extends StatelessWidget {
  final String materiaName;
  final VoidCallback onPressed;

  MateriaCard({required this.materiaName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      width: 60.w,
      height: 85,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 88, 39, 125),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF3A224B),
            spreadRadius: 2,
            offset: Offset(-2, 0),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(alignment: Alignment.center),
        child: Text(
          materiaName,
          style: TextStyle(
            fontSize: 17.5.sp,
            fontFamily: 'Varela Round',
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
