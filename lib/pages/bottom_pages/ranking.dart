// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../components/app_bar.dart';
import '../../components/student_card.dart';
import '../../controller/login_controller.dart';
import '../../services/firebase_service.dart';

class Ranking extends StatelessWidget {
  final FirebaseService firebaseService;
  final List<PlayerData> playerDataList;

  const Ranking({
    super.key,
    required this.firebaseService,
    required this.playerDataList,
  });

  @override
  Widget build(BuildContext context) {
    Stream<List<PlayerData>> getPlayerDataList() {
      return firebaseService.getPlayerDataList();
    }

    Stream<List<PlayerData>> playerDataListStream = getPlayerDataList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder<List<PlayerData>>(
        stream: playerDataListStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              backgroundColor: Colors.black,
              body: Container(
                padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                child: ListView(
                  children: [
                    CustomAppBar(
                      userNameFuture: LoginController().usuarioLogado(),
                      pageTitle: "Ranking",
                    ),
                    SizedBox(height: 50.w),
                    Center(
                      child: Text(
                        'Nenhum dado de ranking disponível.',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            List<PlayerData> playerDataList = snapshot.data ?? [];
            if (playerDataList.isEmpty) {
              return Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                  child: Text('Nenhum dado de ranking disponível.'),
                ),
              );
            } else {
              return Scaffold(
                backgroundColor: Colors.black,
                body: Container(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: ListView(
                    children: [
                      CustomAppBar(
                        userNameFuture: LoginController().usuarioLogado(),
                        pageTitle: "Ranking",
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 200.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 80, 53, 91),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 40),
                              child: Icon(
                                Icons.equalizer,
                                color: Colors.amberAccent,
                                size: 80,
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.only(left: 3, right: 3),
                              child: Text(
                                "Confira a sua posição no ranking dessa semana!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Varela Round',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 20),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    itemCount: playerDataList.length,
                                    itemBuilder: (context, index) {
                                      var playerData = playerDataList[index];
                                      return PlayerCard(
                                        imagePath: 'assets/img/profile.png',
                                        nome: playerData.nome,
                                        pontos: playerData.pontos,
                                        posicao: playerData.posicao ?? 0,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30),
                              child: Icon(
                                Icons.group,
                                color: Colors.amberAccent,
                                size: 80,
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 1, left: 7, right: 7),
                              child: Text(
                                "Adicione mais colegas para ver mais pessoas no ranking!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Varela Round',
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
