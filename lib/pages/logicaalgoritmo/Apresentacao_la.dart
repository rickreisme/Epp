// ignore: file_names
import 'package:epp_firebase/controller/favorito_controller.dart';
import 'package:epp_firebase/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'conteudo_la.dart';
import 'package:epp_firebase/pages/bottom_pages/bottom_bar.dart';

class ApresentacaoLAPage extends StatelessWidget {
  const ApresentacaoLAPage({Key? key}) : super(key: key);

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
              'Apresentação',
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
              onPressed: () => _showExitConfirmationDialog(context),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xFF453650),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Afinal o que é um programa?\n\n'
                  'Instruções!\n'
                  'Um programa é um conjunto de instruções que uma máquina pode seguir para realizar tarefas, e programação é o processo de escrever, testar e manter essas instruções. Para isso usamos a linguagem de programação, existem diversas linguagens de programação, como o C + + por exemplo. Ela fará o intermédio entre o ser humano e a máquina, pois o código pode ser escrito pelo programador e entendido pela máquina, e assim podemos criar nosso programa que é um dos passos para criar um software como os aplicativos do seu celular, computador, e esse aplicativo em que você está agora 🙂.\n\n'
                  'A partir daqui, se inicia o primeiro módulo, Lógica de programação e algoritmo.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.043,
                    color: Colors.white,
                    fontFamily: 'Varela Round',
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.25,
            color: Colors.black,
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF453650)),
                  fixedSize: MaterialStateProperty.all(
                      Size(screenWidth * 0.375, screenHeight * 0.110)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConteudoLAPage(),
                    ),
                  );
                },
                child: Text(
                  'Iniciar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.060,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Ajusta o tamanho do texto com base no tamanho da tela
        double textSize = MediaQuery.of(context).size.width * 0.04;

        // Ajusta o padding com base no tamanho da tela
        double paddingSize = MediaQuery.of(context).size.width * 0.02;

        return AlertDialog(
          title: Text(
            'Voltar às matérias?',
            textAlign: TextAlign.center, // Centraliza
            style: TextStyle(fontSize: textSize),
          ),
          content: SingleChildScrollView(
            // Garante a acessibilidade do conteúdo
            child: ListBody(
              children: <Widget>[
                Padding(
                  // Adiciona Padding ao redor do Row
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          paddingSize), // Espaçamento lateral responsivo
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Espaça os botões entre si
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Fecha a caixa de diálogo
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => BottomBar(firebaseService: firebaseService,)),
                            (Route<dynamic> route) => false,
                          ); // Navega para HomeMaterias e remove todas as rotas anteriores
                        },
                        child: Text(
                          'Sim',
                          style: TextStyle(fontSize: textSize),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Apenas fecha a caixa de diálogo
                        },
                        child: Text(
                          'Não',
                          style: TextStyle(fontSize: textSize),
                        ),
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
