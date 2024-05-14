// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileCard extends StatelessWidget {
  final snackbar2 = SnackBar(
    content: Text("Colega adicionado com sucesso!"),
    backgroundColor: Color.fromARGB(255, 88, 39, 125),
  );

  final String name;
  final String college;
  final String ranking;
  final String imagePath; // Adicionando o caminho da imagem como parâmetro

  ProfileCard({
    required this.name,
    required this.college,
    required this.ranking,
    required this.imagePath, // Recebendo o caminho da imagem como argumento
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43.w,
      height: 38.h,
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 79,
                  height: 79,
                  margin: EdgeInsets.only(top: 15),
                  child: Image.asset(
                      imagePath), // Usando o caminho da imagem fornecido
                ),
                SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: 'Varela Round',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  college,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'Varela Round',
                    color: Colors.white60,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  ranking,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: 'Varela Round',
                    color: Colors.white60,
                  ),
                ),
                SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(snackbar2);
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 3, right: 3),
                    width: 25.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 65, 10, 107),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF3A224B),
                          spreadRadius: 2,
                          offset: Offset(-2, 0),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.person_add,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
