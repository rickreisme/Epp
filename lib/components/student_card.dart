// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlayerCard extends StatelessWidget {
  final String imagePath;
  final String playerName;
  final int points;
  final String position;

  PlayerCard({
    required this.imagePath,
    required this.playerName,
    required this.points,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 118, 8, 203),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PlayerImage(imagePath: imagePath),
          SizedBox(width: 16.0),
          Expanded(
            child: PlayerDetails(
              position: position,
              playerName: playerName,
              points: points,
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
      width: 56,
      height: 56,
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
  final String position;
  final String playerName;
  final int points;

  PlayerDetails({
    required this.position,
    required this.playerName,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$position $playerName",
          style: TextStyle(
            color: Colors.amberAccent,
            fontFamily: 'Varela Round',
            fontSize: 12.5.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          "Fez $points pontos nesta semana!",
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
