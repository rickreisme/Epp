// ignore_for_file: use_super_parameters

import 'package:epp/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'conteudo_la2.dart';
import 'package:epp/pages/bottom_pages/bottom_bar.dart';

class ConteudoLAPage extends StatelessWidget {
  const ConteudoLAPage({Key? key}) : super(key: key);

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
              'Lógica e Algoritmo',
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
                // Chama a função _showExitConfirmationDialog ao invés de voltar diretamente
                _showExitConfirmationDialog(context);
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.4,
            color: const Color(0xFF453650),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'O que é Lógica de programação?\n\n',
                      style: TextStyle(
                        fontSize:
                            screenWidth * 0.055, // tamanho da fonte do titulo
                        color: Colors.white,
                        fontWeight: FontWeight.bold, // título em negrito
                      ),
                    ),
                    TextSpan(
                      text:
                          'Em lógica, você aprende a pensar como um programador, é a capacidade de olhar para um problema e vê-lo de forma estruturada para então resolvê-lo, ela é um dos primeiros passos a se tomar, e independe da linguagem. É sobre aprender a pensar de forma lógica e dividir desafios em passos.',
                      style: TextStyle(
                        fontSize: screenWidth * 0.050,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
              height: 12), // Adiciona espaço entre o texto e a imagem
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset('assets/img/logica.png', fit: BoxFit.contain),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: screenHeight * 0.1, // Mesma altura que a AppBar
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: screenWidth * 0.08,
                        ),
                        onPressed: () {
                          Navigator.pop(context); //volta a pagina anterior
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: screenWidth * 0.08,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ConteudoLA2Page()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
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
          textAlign: TextAlign.center, // Centraliza o texto
          style: TextStyle(fontSize: textSize), // Tamanho do texto responsivo
        ),
        content: SingleChildScrollView(
          // Garante a acessibilidade do conteúdo
          child: ListBody(
            children: <Widget>[
              Padding(
                // Adiciona Padding ao redor do Row
                padding: EdgeInsets.symmetric(
                    horizontal: paddingSize), // Espaçamento lateral responsivo
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Espaça os botões entre si
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Fecha a caixa de diálogo
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => BottomBar(firebaseService: firebaseService,)),
                          (Route<dynamic> route) => false,
                        ); // Navega para HomeMaterias e remove todas as rotas anteriores
                      },
                      child: Text(
                        'Sim',
                        style: TextStyle(
                            fontSize: textSize), // Tamanho do texto responsivo
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pop(); // Apenas fecha a caixa de diálogo
                      },
                      child: Text(
                        'Não',
                        style: TextStyle(
                            fontSize: textSize), // Tamanho do texto responsivo
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
