// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../basic/perfil.dart';
import 'colegas.dart';
import 'caderno.dart';
import 'home_materias.dart';
import 'ranking.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _opcaoSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _opcaoSelecionada,
        onTap: (opcao) {
          setState(() {
            _opcaoSelecionada = opcao;
          });
        },

        backgroundColor: Color(0xFF330E50),
        fixedColor: Colors.white,
        unselectedItemColor: Color(0xFF8E59B6),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        iconSize: 33,
        

        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/img/home.png')),
            label: 'Home - Matérias'
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/img/friends.png')),
            label: 'Amigos'
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/img/rankings.png')),
            label: 'Ranking'
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/img/book.png')),
            label: 'Caderno'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil'
          ),
        ],
      ),

      body: IndexedStack(
        index: _opcaoSelecionada,
        children: <Widget> [
          HomeMaterias(),
          Colegas(),
          Ranking(),
          Caderno(),
          PerfilPage(),
        ],

      ),
    );
  }
}