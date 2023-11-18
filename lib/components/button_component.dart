// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../pages/auth/cadastro.dart';
import '../pages/auth/senha_reset.dart';

class Esqueceu extends StatelessWidget {
  const Esqueceu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 190),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            child: Text(
              "Esqueceu a senha?",
              style: TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Varela Round',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SenhaReset(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AindaNao extends StatelessWidget {
  const AindaNao({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Ainda não possui uma conta?",
          style: TextStyle(
              color: Color(0xFFF1E2E2),
              fontFamily: 'Varela Round',
              fontSize: 13.sp,
              fontWeight: FontWeight.w600),
        ),
        TextButton(
          child: Text(
            "Cadastre-se",
            style: TextStyle(
                color: Color(0xFF220339),
                fontFamily: 'Varela Round',
                fontSize: 13.5.sp,
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cadastro(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class OuEntre extends StatelessWidget {
  const OuEntre({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 0.5,
          color: Color(0xFF330E50),
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text('Ou entre com',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Varela Round',
                fontSize: 12.5.sp,
              )),
        ),
        Expanded(
            child: Divider(
          thickness: 0.5,
          color: Color(0xFF330E50),
        )),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
