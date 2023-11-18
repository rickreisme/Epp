// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void mensagemErro(context, String msg) {
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Color.fromARGB(255, 194, 22, 48),
        content: Text(
        msg,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15
          ),
        ),
        duration: const Duration(seconds: 3),
        ),
    );
}

void mensagemSucesso(context, String msg) {
 ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
    backgroundColor: Color.fromARGB(255, 108, 14, 180),
    content: Text(
    msg,
    style: TextStyle(
      color: Colors.white, 
      fontSize: 15
      ),
    ),
    duration: const Duration(seconds: 3),
    ),
  );
}