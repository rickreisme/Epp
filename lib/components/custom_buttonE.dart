// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 42,
      decoration: BoxDecoration(
        color: Color(0xFF330E50),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: SizedBox(
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFFBFB9B9),
                    fontFamily: 'Varela Round',
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.zero), // Remove o padding padrão do TextButton
          ),
        ),
      ),
    );
  }
}
