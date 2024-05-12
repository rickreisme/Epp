// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import '../../components/app_bar.dart';
import '../../components/colegas_card.dart';
import '../../controller/login_controller.dart';

class Colegas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: ListView(
          children: [
            CustomAppBar(
              userNameFuture: LoginController().usuarioLogado(),
              pageTitle: "Colegas",
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileCard(
                        name: "Sara Parker",
                        college: "Fatec Ribeirão Preto",
                        ranking: "Ranking Prata",
                        imagePath: "assets/img/sara.png",
                      ),
                      ProfileCard(
                          name: "Elizabete Souza",
                          college: "Fatec Ribeirão Preto",
                          ranking: "Raking Ouro",
                          imagePath: "assets/img/elizabete.png"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileCard(
                        name: "João Ricardo",
                        college: "USP\nRibeirão Preto",
                        ranking: "Ranking Ouro",
                        imagePath: "assets/img/jose.png",
                      ),
                      ProfileCard(
                        name: "Claudia Moura",
                        college: "Fatec Ribeirão Preto",
                        ranking: "Ranking Ouro",
                        imagePath: "assets/img/claudia.png",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileCard(
                        name: "Roberta Pereira",
                        college: "Unaerp Ribeirão Preto",
                        ranking: "Ranking Bronze",
                        imagePath: "assets/img/roberta.png",
                      ),
                      ProfileCard(
                        name: "Marcelo Ribeiro",
                        college: "Fatec Ribeirão Preto",
                        ranking: "Ranking Prata",
                        imagePath: "assets/img/marcelo.png",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
