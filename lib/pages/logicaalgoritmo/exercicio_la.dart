import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:epp_firebase/pages/logicaalgoritmo/Apresentacao_la.dart';
import 'package:epp_firebase/pages/logicaalgoritmo/conclusao_la.dart';
import 'package:flutter/foundation.dart';

class ExercicioLAPage extends StatefulWidget {
  const ExercicioLAPage({Key? key}) : super(key: key);

  @override
  _ExercicioLAPageState createState() => _ExercicioLAPageState();
}

class _ExercicioLAPageState extends State<ExercicioLAPage> {
  //essa é lista como aparece ao entrar na pagina
  final List<String> _itens = [
    'Ferver a água',
    'Servir o café na xícara',
    'Pegar a xícara',
    'Por pó de café no filtro',
    'Pegar o filtro',
    'Esperar o café coar',
    'Despejar agua fervida no filtro',
  ];

  final List<List<String>> _correctOrders = [
    //essas são as combinações possíveis
    [
      'Ferver a água',
      'Pegar a xícara',
      'Pegar o filtro',
      'Por pó de café no filtro',
      'Despejar agua fervida no filtro',
      'Esperar o café coar',
      'Servir o café na xícara',
    ],
    [
      'Pegar a xícara',
      'Pegar o filtro',
      'Por pó de café no filtro',
      'Ferver a água',
      'Despejar agua fervida no filtro',
      'Esperar o café coar',
      'Servir o café na xícara',
    ],
    [
      'Pegar o filtro',
      'Por pó de café no filtro',
      'Pegar a xícara',
      'Ferver a água',
      'Despejar agua fervida no filtro',
      'Esperar o café coar',
      'Servir o café na xícara',
    ],
    [
      'Pegar o filtro',
      'Pegar a xícara',
      'Por pó de café no filtro',
      'Ferver a água',
      'Despejar agua fervida no filtro',
      'Esperar o café coar',
      'Servir o café na xícara',
    ],
    [
      'Ferver a água',
      'Pegar o filtro',
      'Pegar a xícara',
      'Por pó de café no filtro',
      'Despejar agua fervida no filtro',
      'Esperar o café coar',
      'Servir o café na xícara',
    ],
    [
      'Pegar a xícara',
      'Pegar o filtro',
      'Ferver a água',
      'Por pó de café no filtro',
      'Despejar agua fervida no filtro',
      'Esperar o café coar',
      'Servir o café na xícara',
    ],
    [
      'Ferver a água',
      'Pegar o filtro',
      'Pegar a xícara',
      'Por pó de café no filtro',
      'Despejar agua fervida no filtro',
      'Esperar o café coar',
      'Servir o café na xícara',
    ],
    [
      'Pegar o filtro',
      'Ferver a água',
      'Por pó de café no filtro',
      'Pegar a xícara',
      'Despejar agua fervida no filtro',
      'Esperar o café coar',
      'Servir o café na xícara',
    ],
    [
      'Pegar a xícara',
      'Ferver a água',
      'Pegar o filtro',
      'Por pó de café no filtro',
      'Despejar agua fervida no filtro',
      'Esperar o café coar',
      'Servir o café na xícara',
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
              'Fazendo uma xícara de café:',
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
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 20, // Aumentando a fonte do texto
                        ),
                      ),
                    ),
                    trailing: const SizedBox
                        .shrink(), // Removendo o ícone do lado direito
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
                      Size(screenWidth * 0.375, screenHeight * 0.110)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18))),
                ),
                onPressed: verificarExercicio,
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

  void verificarExercicio() {
    // Aqui vai o código para verificar se o exercício está correto
   bool isCorrect = _correctOrders.any((order) => listEquals(_itens, order));
    if (isCorrect) {
      // Se o exercício estiver correto, chame o método para verificar e atualizar o módulo 1
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

  Future<void> verificarEAtualizarModuloUm(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final docRef =
        FirebaseFirestore.instance.collection('usuarios').doc(user.uid);
    final doc = await docRef.get();

    if (!doc.exists) return;

    final userData = doc.data();
    final bool completouModuloUm = userData?['completouModuloUm'] ?? false;

    if (!completouModuloUm) {
      await docRef.update(
          {'completouModuloUm': true, 'pontos': FieldValue.increment(5)});
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Parabéns!'),
            content: const Text('Você completou o Módulo 1 e ganhou 5 pontos!'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
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
