// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:epp/services/firebase_service.dart';
import 'package:flutter/material.dart';
import '../basic/perfil.dart';
import 'colegas.dart';
import 'caderno.dart';
import 'home_materias.dart';
import 'ranking.dart';

class BottomBar extends StatefulWidget {
  final FirebaseService firebaseService;

  const BottomBar({super.key, required this.firebaseService});

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
              icon: Icon(Icons.home), label: 'Home - Matérias'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Amigos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Ranking'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Caderno'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
      body: IndexedStack(
        index: _opcaoSelecionada,
        children: <Widget>[
          HomeMaterias(),
          Colegas(),
          Ranking(
            firebaseService: widget.firebaseService,
            playerDataList: [],
          ),
          Caderno(),
          PerfilPage(),
        ],
      ),
    );
  }
}
