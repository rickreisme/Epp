// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epp/model/mensagem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../controller/anotacao_controller.dart';
import '../../controller/login_controller.dart';
import '../../model/lembrete.dart';

class LembretePage extends StatefulWidget {
  const LembretePage({super.key});

  @override
  State<LembretePage> createState() => _LembretePageState();
}

class _LembretePageState extends State<LembretePage> {
  var lemb = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Meus Lembretes",
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
        child: StreamBuilder<QuerySnapshot>(
          stream: AnotacaoController().listaLembrete().snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text('Não foi possível conectar.'),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      String id = dados.docs[index].id;
                      dynamic item = dados.docs[index].data();
                      return Card(
                        color: Color.fromARGB(255, 88, 39, 125),
                        child: ListTile(
                          titleTextStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Varela Round'),
                          iconColor: Colors.white,
                          leading: Icon(Icons.sticky_note_2),
                          title: Text(item['lemb']),
                          onTap: () {
                            mensagemErro(context, "Não é possível editar um lembrete!");
                          },
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.white,
                            onPressed: () {
                              AnotacaoController().excluirLembrete(context, id);
                            },
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      'Nenhum lembrete foi encontrado.',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Varela Round',
                          fontSize: 13.sp),
                    ),
                  );
                }
            }
          },
        ),
      ),
      floatingActionButton: TextButton(
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 88, 39, 125),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: FaIcon(FontAwesomeIcons.pencil,
                    size: 20, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(
                  "Novo Lembrete",
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: 'Varela Round',
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          saveLembrete(context);
        },
      ),
    );
  }

  void saveLembrete(BuildContext context, {docId, TextEditingController? lembController} ) {
    TextEditingController lemb = lembController ?? TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: Color.fromARGB(255, 235, 235, 235),
              title: Text(
                "Lembrete",
                style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: 'Varela Round',
                    color: Color.fromARGB(255, 71, 20, 109),
                    fontWeight: FontWeight.w600),
              ),
              contentTextStyle: TextStyle(color: Colors.white),
              content: SizedBox(
                height: 450,
                width: 400,
                child: Column(
                  children: [
                    TextField(
                      controller: lemb,
                      style: TextStyle(
                          color: Color.fromARGB(255, 71, 20, 109),
                          fontFamily: 'Varela Round',
                          fontWeight: FontWeight.w600),
                      maxLines: 15,
                      decoration: InputDecoration(
                        labelText: 'Escreva seu lembrete',
                        labelStyle: TextStyle(
                            color: Color.fromARGB(255, 71, 20, 109),
                            fontFamily: 'Varela Round',
                            fontWeight: FontWeight.w600),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text("Fechar",
                      style: TextStyle(
                          color: Color.fromARGB(255, 71, 20, 109),
                          fontSize: 13.sp,
                          fontFamily: 'Varela Round',
                          fontWeight: FontWeight.w600)),
                  onPressed: () {
                    lemb.clear();
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(
                        255, 71, 20, 109), // Defina a cor desejada aqui
                  ),
                  child: Text("Salvar",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Varela Round',
                          color: Colors.white)),
                  onPressed: () {
                    var l = Lembrete(
                      LoginController().idUsuario(),
                      lemb.text,
                    );
                    lemb.clear();
                    if (docId == null) {
                      AnotacaoController().adicionarLembrete(context, l);
                    } else {
                      AnotacaoController().atualizarLembrete(context, docId, l);
                    }
                  },
                ),
              ],
            ),
          );
        });
  }
}
