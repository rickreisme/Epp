// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlayerCard extends StatelessWidget {
  final String imagePath;
  final String nome;
  final int pontos;
  final int posicao;

  PlayerCard({
    required this.imagePath,
    required this.nome,
    required this.pontos,
    required this.posicao,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color.fromARGB(255, 118, 8, 203);
    if (posicao != 1) {
      backgroundColor = Color.fromARGB(255, 123, 86, 151);
    }

    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: PlayerImage(imagePath: imagePath),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: PlayerDetails(
              posicao: posicao,
              nome: nome,
              pontos: pontos,
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerImage extends StatelessWidget {
  final String imagePath;

  PlayerImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PlayerDetails extends StatelessWidget {
  final int? posicao;
  final String nome;
  final int pontos;

  PlayerDetails({
    required this.posicao,
    required this.nome,
    required this.pontos,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "#$posicao - $nome",
          style: TextStyle(
            color: Colors.amberAccent,
            fontFamily: 'Varela Round',
            fontSize: 12.5.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          "Fez $pontos pontos nesta semana!",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Varela Round',
            fontSize: 12.5.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
