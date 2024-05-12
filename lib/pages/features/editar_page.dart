// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controller/login_controller.dart';

class EditarPage extends StatefulWidget {
  const EditarPage({super.key});

  @override
  State<EditarPage> createState() => _EditarPageState();
}

class _EditarPageState extends State<EditarPage> {
  var novoNome = TextEditingController();
  var novoSobrenome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Editar Perfil",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Varela Round',
              fontSize: 20.sp,
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "Edite seus dados aqui:",
                    style: TextStyle(
                      fontFamily: 'Varela Round',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: TextField(
                    controller: novoNome,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: " Nome",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: TextStyle(
                          fontFamily: 'Varela Round',
                          color: Color(0xFF5F1796),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(bottom: 2, left: 10),
                          child: Icon(
                            Icons.person,
                            color: Color(0xFF5F1796),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        alignLabelWithHint: true),
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Varela Round',
                      color: Color(0xFF5F1796),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                SizedBox(
                  height: 45,
                  child: TextFormField(
                    controller: novoSobrenome,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: " Sobrenome",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: TextStyle(
                          fontFamily: 'Varela Round',
                          color: Color(0xFF5F1796),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(bottom: 2, left: 10),
                          child: Icon(
                            Icons.person,
                            color: Color(0xFF5F1796),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        alignLabelWithHint: true),
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Varela Round',
                      color: Color(0xFF5F1796),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 200,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 108, 14, 180),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 0.0),
                          spreadRadius: 1.0,
                          blurRadius: 7.0),
                    ],
                  ),
                  child: SizedBox(
                    child: (TextButton(
                      onPressed: () {
                        atualizaNome(context, novoNome, novoSobrenome);
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets
                            .zero), // Remove o padding padrão do TextButton
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Enviar",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Varela Round',
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future atualizaNome(context, nome, sobrenome) async {
    String docId = '';

    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: LoginController().idUsuario())
        .get()
        .then((resultado) {
      docId = resultado.docs[0].id.toString();
    });

    await FirebaseFirestore.instance
        .collection('usuarios')
        .doc(docId)
        .update({'nome': nome.text, 'sobrenome': sobrenome.text});
  }
}
