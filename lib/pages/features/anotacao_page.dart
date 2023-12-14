// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epp_firebase/controller/anotacao_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../controller/login_controller.dart';
import '../../model/anotacao.dart';

class AnotacaoPage extends StatefulWidget {
  const AnotacaoPage({super.key});

  @override
  State<AnotacaoPage> createState() => _AnotacaoPageState();
}

class _AnotacaoPageState extends State<AnotacaoPage> {

  var titulo = TextEditingController();
  var desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
                "Minhas Anotações",
                  style: GoogleFonts.varelaRound(
                      textStyle: TextStyle(fontSize: 20.sp,
                      fontWeight: FontWeight.w400),
                  ),
                textAlign: TextAlign.center,
               ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        child: StreamBuilder<QuerySnapshot>(
          stream: AnotacaoController().lista().snapshots(),
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
                          titleTextStyle: TextStyle(color: Colors.white,
                            fontSize: 12.sp, fontFamily: 'Varela Round'),
                          iconColor: Colors.white,
                          leading: Icon(Icons.description),
                          title: Text(item['titulo']),
                          subtitle: Text(item['descricao'], 
                            style: TextStyle(color: Colors.white, fontFamily: 'Varela Round')
                          ),
                          onTap: () {
                            titulo.text = item['titulo'];
                            desc.text = item['descricao'];
                            saveNote(context, docId: id);
                          },
                          onLongPress: (){
                            AnotacaoController().excluir(context, id);
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('Nenhuma anotação encontrada.'),
                  );
                }
            }
          },
        ),
      ),
      floatingActionButton: TextButton(
        child: Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 88, 39, 125),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: FaIcon(FontAwesomeIcons.pencil, size: 20, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Text(
                  "Anotar",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: 'Varela Round',
                      color: Colors.white
                    ),
                  ),
              ),
            ],
          ),
        ),
        onPressed:() {
          saveNote(context);
         },
        ),
    );
  }

  void saveNote(context, {docId}) {
  showDialog(context: context,
    builder: (BuildContext context){
      return SingleChildScrollView(
      
        child: AlertDialog(
          backgroundColor: Color.fromARGB(255, 235, 235, 235),
          title: Text("Anotando",
                    style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: 'Varela Round',
                    color: Color.fromARGB(255, 71, 20, 109),
                    fontWeight: FontWeight.w600
                    ),
                  ),
          contentTextStyle: TextStyle(color: Colors.white),
          content: SizedBox(
              height: 500,
              width: 335,
              child: Column(
                children: [
                  TextField(
                    controller: titulo,
                    style: TextStyle(
                      color: Color.fromARGB(255, 71, 20, 109), fontWeight: FontWeight.w600,
                      fontFamily: 'Varela Round'
                    ),
                    decoration: InputDecoration(
                      labelText: 'Título', fillColor: Color.fromARGB(255, 71, 20, 109),
                      labelStyle: TextStyle(color: Color.fromARGB(255, 71, 20, 109)),
                      prefixIcon: Icon(Icons.description),
                      prefixIconColor: Color.fromARGB(255, 71, 20, 109),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: desc,
                    style: TextStyle(
                      color: Color.fromARGB(255, 71, 20, 109),fontWeight: FontWeight.w600,
                      fontFamily: 'Varela Round'
                    ),
                    maxLines: 15,
                    decoration: InputDecoration(
                      labelText: 'Descrição',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 71, 20, 109)),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text("Fechar", style: TextStyle(color: Color.fromARGB(255, 71, 20, 109),
                fontSize: 13.sp, fontFamily: 'Varela Round', fontWeight: FontWeight.w600)
                ),
                onPressed: () {
                  titulo.clear();
                  desc.clear();
                  Navigator.of(context).pop();
                },
              ),
              Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 71, 20, 109), // Defina a cor desejada aqui
                    ),
                  child: Text("Salvar", style: TextStyle(
                    fontSize: 13.sp, 
                    fontFamily: 'Varela Round',
                    color: Colors.white
                    )
                  ),
                  onPressed: () {
                    var a = Anotacao(
                      LoginController().idUsuario(),
                      titulo.text,
                      desc.text,
                    );
                    titulo.clear();
                    desc.clear();
                    if (docId == null) {
                      AnotacaoController().adicionar(context, a);
                    } else {
                      AnotacaoController().atualizar(context, docId, a);
                    }
                  },
                ),
              ),
            ],
        ),
      );
    }
  );
}
}
