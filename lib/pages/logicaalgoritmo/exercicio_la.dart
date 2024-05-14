// ignore_for_file: library_private_types_in_public_api, use_super_parameters, avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:epp/pages/logicaalgoritmo/Apresentacao_la.dart';
import 'package:epp/pages/logicaalgoritmo/conclusao_la.dart';
import 'package:flutter/foundation.dart';

import '../../controller/login_controller.dart';
import '../bottom_pages/bottom_bar.dart';

class ExercicioLAPage extends StatefulWidget {
  const ExercicioLAPage({Key? key}) : super(key: key);

  @override
  _ExercicioLAPageState createState() => _ExercicioLAPageState();
}

class _ExercicioLAPageState extends State<ExercicioLAPage> {
  Future<bool> usuarioCompletoModuloUm() async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('uid', isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> userData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;

        if (userData.containsKey('completouModuloUm') &&
            userData['completouModuloUm'] is bool) {
          bool completouModuloUm = userData['completouModuloUm'] ?? false;

          //usuario completou modulo = true ? false
          return completouModuloUm;
        } else {
          print("O campo não é booleano");
          return false;
        }
      } else {
        print("Documento não encontrado");
        return false;
      }
    } catch (e) {
      print('Erro ao verificar se o usuário completou o módulo: $e');
      // Em caso de erro, retorna false
      return false;
    }
  }

  //essa é lista como aparece ao entrar na pagina
  final List<String> _itens = [
    'Presunto',
    'Fatia de pão (topo)',
    'Tomate',
    'Hambúrger',
    'Alface',
    'Fatia de pão (base)',
    'Queijo',
  ];

  final List<List<String>> _correctOrders = [
    //essas são as combinações possíveis
    [
      'Fatia de pão (topo)',
      'Presunto',
      'Tomate',
      'Hambúrger',
      'Alface',
      'Queijo',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Hambúrger',
      'Presunto',
      'Alface',
      'Tomate',
      'Queijo',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Presunto',
      'Hambúrger',
      'Queijo',
      'Tomate',
      'Alface',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Presunto',
      'Tomate',
      'Hambúrger',
      'Queijo',
      'Alface',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Queijo',
      'Presunto',
      'Tomate',
      'Hambúrger',
      'Alface',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Queijo',
      'Tomate',
      'Presunto',
      'Alface',
      'Hambúrger',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Queijo',
      'Hambúrger',
      'Tomate',
      'Alface',
      'Presunto',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Queijo',
      'Alface',
      'Hambúrger',
      'Presunto',
      'Tomate',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Queijo',
      'Alface',
      'Tomate',
      'Hambúrger',
      'Presunto',
      'Fatia de pão (base)'
    ],
    // Combinações adicionadas
    [
      'Fatia de pão (topo)',
      'Tomate',
      'Hambúrger',
      'Presunto',
      'Alface',
      'Queijo',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Tomate',
      'Presunto',
      'Hambúrger',
      'Queijo',
      'Alface',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Tomate',
      'Alface',
      'Presunto',
      'Hambúrger',
      'Queijo',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Hambúrger',
      'Tomate',
      'Alface',
      'Queijo',
      'Presunto',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Tomate',
      'Queijo',
      'Presunto',
      'Alface',
      'Hambúrger',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Tomate',
      'Queijo',
      'Alface',
      'Hambúrger'
      'Presunto',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Hambúrger',
      'Alface',
      'Presunto',
      'Tomate',
      'Queijo',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Alface',
      'Presunto',
      'Queijo',
      'Tomate',
      'Hambúrger',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Alface',
      'Tomate',
      'Hambúrger',
      'Presunto',
      'Queijo',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Alface',
      'Hambúrger',
      'Tomate',
      'Queijo',
      'Presunto',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Alface',
      'Queijo',
      'Presunto',
      'Hambúrger',
      'Tomate',
      'Fatia de pão (base)'
    ],
    [
      'Fatia de pão (topo)',
      'Alface',
      'Queijo',
      'Hambúrger',
      'Tomate',
      'Presunto',
      'Fatia de pão (base)'
    ],
  ];

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final String item = _itens.removeAt(oldIndex);
      _itens.insert(newIndex, item);
    });
  }

  String _message = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF453650),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
        child: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02),
            child: Text(
              'Exercício',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Varela Round',
                fontSize: screenWidth * 0.06,
              ),
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: screenWidth * 0.07,
              ),
              onPressed: () {
                _showExitConfirmationDialog(context);
              },
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 8.0,
                top: 8.0,
                bottom: 8.0,
                right: screenWidth * 0.1), // alterei aqui
            child: Text(
              'Fazendo um sanduíche - Ordene os ingredientes:',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.05,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ReorderableListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _itens.length,
              itemBuilder: (BuildContext context, int index) {
                final item = _itens[index];
                return Container(
                  key: ValueKey("$item-$index"),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 20, // Aumentando a fonte do texto
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Icon(Icons.drag_handle)
                        ],
                      ),
                    ),
                    // trailing: const SizedBox
                    //     .shrink(), // Removendo o ícone do lado direito
                  ),
                );
              },
              onReorder: _onReorder,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Fim do algoritmo',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width *
                      0.05, // 5% da largura da tela
                  color: Colors.white,
                  fontFamily: 'Varela Round',
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: screenHeight *
            0.25, // Definindo a altura do bloco preto como 25% da tela
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_message.isNotEmpty)
              Text(
                _message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.05,
                ),
              ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF453650)),
                  fixedSize: MaterialStateProperty.all(
                      Size(screenWidth * 0.400, screenHeight * 0.110)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18))),
                ),
                onPressed: () {
                  verificarExercicio();
                },
                child: Text(
                  'Verificar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.060,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void verificarExercicio() async {
    bool completo = await usuarioCompletoModuloUm();
    print(completo);

    bool isCorrect = _correctOrders.any((order) => listEquals(_itens, order));
    if (completo) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Módulo já concuído"),
          content: const Text("Parabéns! Você acertou novamente!"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomBar(
                        firebaseService: firebaseService,
                      ),
                    ),
                  );

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BottomBar(firebaseService: firebaseService)),
                    (route) => false,
                  );
                },
                child: const Text("Finalizar")),
          ],
        ),
      );
    } else {
      if (isCorrect) {
        atualizaCompletaModuloUm(true);
        verificarEAtualizarModuloUm(context);

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ConclusaoLAPage()),
        );
      } else {
        setState(() {
          _message = '\n Ops parece que algo não está fazendo sentido';
        });
      }
    }
  }

  void atualizaCompletaModuloUm(bool completou) async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

      // Realiza a consulta para encontrar o documento do usuário com base no UID
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('uid', isEqualTo: userId)
          .get();

      // Verifica se a consulta retornou algum documento
      if (querySnapshot.docs.isNotEmpty) {
        // Obtém a referência ao primeiro documento retornado pela consulta
        DocumentReference userRef = querySnapshot.docs.first.reference;

        await userRef.update({
          'completouModuloUm': completou,
        });

        print('Documento do usuário atualizado com sucesso!');
      } else {
        print('Documento do usuário não encontrado.');
      }
    } catch (e) {
      print('Erro ao atualizar o documento do usuário: $e');
    }
  }

  void atualizaPontos() async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

      // Realiza a consulta para encontrar o documento do usuário com base no UID
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('usuarios')
          .where('uid', isEqualTo: userId)
          .get();

      // Verifica se a consulta retornou algum documento
      if (querySnapshot.docs.isNotEmpty) {
        // Obtém a referência ao primeiro documento retornado pela consulta
        DocumentReference userRef = querySnapshot.docs.first.reference;

        await userRef.update({
          'pontos': FieldValue.increment(5),
        });

        print('Documento do usuário atualizado com sucesso!');
      } else {
        print('Documento do usuário não encontrado.');
      }
    } catch (e) {
      print('Erro ao atualizar o documento do usuário: $e');
    }
  }

  Future<void> verificarEAtualizarModuloUm(BuildContext context) async {
    atualizaPontos();
  }

  void _showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double textSize = MediaQuery.of(context).size.width * 0.04;
        double paddingSize = MediaQuery.of(context).size.width * 0.02;

        return AlertDialog(
          title: Text(
            'Voltar para a apresentação?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: textSize),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: paddingSize),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ApresentacaoLAPage()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child:
                            Text('Sim', style: TextStyle(fontSize: textSize)),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child:
                            Text('Não', style: TextStyle(fontSize: textSize)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
