// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../controller/login_controller.dart';
import '../auth/login.dart';
import '../features/editar_page.dart';
import '../features/lembrete_page.dart';
import 'configs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'notifications.dart';

Stream<int> getUserPointsStream() {
  return FirebaseFirestore.instance
      .collection('usuarios')
      .doc(LoginController().idUsuario()) // substitua 'uid' pelo ID do usuário
      .snapshots()
      .map((snapshot) => snapshot.data()?['pontos']);
}

Future<String> fetchUserNome() async {
  await Future.delayed(Duration(microseconds: 1));
  return LoginController().nomeUsuarioLogado();
}

Future<String> fetchUserUser() async {
  await Future.delayed(Duration(microseconds: 1));
  return LoginController().userUsuarioLogado();
}

Future<String> fetchUserFac() async {
  await Future.delayed(Duration(microseconds: 1));
  return LoginController().faculdadeUsuarioLogado();
}

Future<String> fetchUserIdad() async {
  await Future.delayed(Duration(microseconds: 1));
  return LoginController().idadeUsuarioLogado();
}

Future<String> fetchUserPontos() async {
  await Future.delayed(Duration(microseconds: 1));
  return LoginController().pontosUsuarioLogado();
}

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Meu Perfil",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Varela Round',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                  color: Color(0xFF5F1796),
                  icon: SizedBox(
                    height: 55,
                    width: 55,
                    child: Icon(
                      Icons.notifications,
                      size: 35,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  color: Color(0xFF5F1796),
                  icon: SizedBox(
                    height: 41,
                    width: 41,
                    child: Icon(
                      Icons.settings,
                      size: 35,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePageConfigs(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 296,
              height: 55.h,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 74, 41, 98),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/img/profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      FutureBuilder<String>(
                          future: fetchUserNome(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextButton.icon(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      textStyle: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'Varela Round',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ),
                                    );
                                    LoginController().logout();
                                  },
                                  icon: Icon(Icons.exit_to_app, size: 20),
                                  label: Text(snapshot.data.toString()),
                                ),
                              );
                            }
                            return Text('');
                          }),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: FutureBuilder<String>(
                            future: fetchUserUser(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          snapshot.data.toString(),
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontFamily: 'Varela Round',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )));
                              }
                              return Text('');
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: FutureBuilder<String>(
                            future: fetchUserFac(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          snapshot.data.toString(),
                                          style: TextStyle(
                                            color: Colors.white60,
                                            fontFamily: 'Varela Round',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )));
                              }
                              return Text('');
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: FutureBuilder<String>(
                            future: fetchUserIdad(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Text(
                                      snapshot.data.toString(),
                                      style: TextStyle(
                                        color: Colors.white60,
                                        fontFamily: 'Varela Round',
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ));
                              }
                              return Text('');
                            }),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          "Nível 1",
                          style: TextStyle(
                              color: Colors.white54,
                              fontFamily: 'Varela Round',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: StreamBuilder<int>(
                          stream: getUserPointsStream(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              return Directionality(
                                textDirection: TextDirection.ltr,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "${snapshot.data ?? '0'} pontos",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontFamily: 'Varela Round',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }
                            return Text('');
                          },  
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 52, 4, 82),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        margin: EdgeInsets.only(top: 20),
                        child: TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditarPage(),
                                  ));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            label: Padding(
                              padding: EdgeInsets.only(top: 2),
                              child: Text("Editar Perfil",
                                  style: TextStyle(
                                      fontFamily: 'Varela Round',
                                      fontSize: 14.sp,
                                      color: Colors.white)),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LembretePage(),
                  ),
                );
              },
              child: Container(
                width: 310.w,
                height: 250,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 91, 9, 143),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        "Lembretes",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Varela Round',
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Toque para ver os seus lembretes",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Varela Round',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: FaIcon(
                          FontAwesomeIcons.solidNoteSticky,
                          size: 100,
                          color: Color.fromARGB(255, 43, 16, 64),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 298,
              height: 400,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 91, 9, 143),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 90, top: 20, bottom: 20),
                        child: Text(
                          "Conquistas",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Varela Round',
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 7, right: 7),
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 64, 7, 156)),
                    child: Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          child: FaIcon(
                            FontAwesomeIcons.award,
                            size: 25,
                            color: Colors.amber,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Text(
                            "Init: Você começou os seus estudos!",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Varela Round',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: FaIcon(
                      FontAwesomeIcons.award,
                      size: 100,
                      color: Colors.white60,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "Continue estudando para desbloquear mais conquistas!",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Varela Round',
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
