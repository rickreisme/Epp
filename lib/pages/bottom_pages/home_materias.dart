// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:epp_firebase/components/app_bar.dart';
import 'package:epp_firebase/components/card_materia.dart';
import 'package:epp_firebase/components/locked_card_materias.dart';
import 'package:flutter/material.dart';

import '../../controller/login_controller.dart';

class HomeMaterias extends StatelessWidget {
  const HomeMaterias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: ListView(
          children: [
            CustomAppBar(
              userNameFuture: LoginController().usuarioLogado(),
              pageTitle: "Matérias",
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: MateriaCard(materiaName: "Lógica e Algoritmo")),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          child: LockedMateriaCard(
                              materiaName: "Estrutura\nBásica")),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: LockedMateriaCard(materiaName: "Variáveis")),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          child: LockedMateriaCard(materiaName: "Operadores")),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: LockedMateriaCard(
                              materiaName: "Estruturas\nCondicionais")),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          child: LockedMateriaCard(
                              materiaName: "Estruturas\nde repetição")),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: LockedMateriaCard(materiaName: "Vetores")),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(child: LockedMateriaCard(materiaName: "Matrizes")),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
