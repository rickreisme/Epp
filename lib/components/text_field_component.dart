// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFieldComp extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Function(String) onChanged;

  TextFieldComp(
      {required this.labelText,
      required this.controller,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      controller: controller,
      onChanged: onChanged,
    );
  }
}

class TextFormFieldTxt extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final TextInputAction textInputAction;
  bool obscureText;

  TextFormFieldTxt({
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.prefixIcon,
    required this.textInputAction,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: TextStyle(
              fontFamily: 'Varela Round',
              color: Color(0xFF5F1796),
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(bottom: 2, left: 10),
                    child: Icon(
                      prefixIcon,
                      color: Color(0xFF5F1796),
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            alignLabelWithHint: true),
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Varela Round',
          color: Color(0xFF5F1796),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class TextFormFieldLogin extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final TextInputAction textInputAction;
  bool obscureText;

  TextFormFieldLogin({
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.prefixIcon,
    required this.textInputAction,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94.w,
      height: 6.3.h,
      child: TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: TextStyle(
              fontFamily: 'Varela Round',
              color: Color(0xFF5F1796),
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(bottom: 2, left: 10),
                    child: Icon(
                      prefixIcon,
                      color: Color(0xFF5F1796),
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
            alignLabelWithHint: true),
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Varela Round',
          fontWeight: FontWeight.w600,
          color: Color(0xFF5F1796),
        ),
      ),
    );
  }
}
