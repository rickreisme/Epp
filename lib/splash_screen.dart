// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then(
      (_) => Navigator.of(context).pushReplacementNamed('/login')
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.black87,
        width: double.infinity,
        child: Image.asset(
          'assets/img/Logo.png',
          width: 500,
          height: 500,
        ),
      ),
    );
  }
}