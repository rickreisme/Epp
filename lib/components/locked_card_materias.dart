// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LockedMateriaCard extends StatelessWidget {
  final String materiaName;
  final double cardWidthPercentage;

  LockedMateriaCard(
      {required this.materiaName, this.cardWidthPercentage = 0.3});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      width: 60.w,
      height: 85,
      decoration: BoxDecoration(
        color: Color.fromRGBO(98, 54, 131, 0),
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
        onPressed: () {},
        style: TextButton.styleFrom(alignment: Alignment.center),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                materiaName,
                style: TextStyle(
                  fontSize: 17.5.sp,
                  fontFamily: 'Varela Round',
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 500,
              height: 500,
              child: Icon(
                Icons.lock,
                color: Colors.amberAccent,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
