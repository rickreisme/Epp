// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../pages/auth/cadastro.dart';
import '../pages/auth/senha_reset.dart';

class Esqueceu extends StatelessWidget {
  const Esqueceu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
    );
  }
}

class AindaNao extends StatelessWidget {
  const AindaNao({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: Color(0xFFF1E2E2),
                fontFamily: 'Varela Round',
                fontSize: 13.5.sp,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: "Ainda não possui uma conta? ",
                ),
                TextSpan(
                  text: "Cadastre-se",
                  style: TextStyle(
                    color: Color(0xFF220339),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cadastro(),
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
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

class Termos extends StatelessWidget {
  final VoidCallback onPressed;

  const Termos({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Ao se cadastrar, você concorda com os",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Varela Round',
            fontSize: 12.sp,
          ),
        ),
        TextButton(
           child: Text(
            "Termos de Uso",
            style: TextStyle(
              color: Color(0xFF220339),
              fontFamily: 'Varela Round',
            fontSize: 12.5.sp,
            fontWeight: FontWeight.w600
            ),
           ),
          onPressed: onPressed)
      ],
    );
  }
}