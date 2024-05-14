import 'package:epp/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'conteudo_la5.dart';
import 'package:epp/pages/bottom_pages/bottom_bar.dart';


class ConteudoLA4Page extends StatelessWidget {
  const ConteudoLA4Page({super.key});

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
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'fritando um ovo:\n\n'
                'Passo 1 — Pegar a frigideira\n'
                'Passo 2 — colocar frigideira no fogão \n'
                'Passo 3 — acender o fogo\n'
                'Passo 4 — Pegar o óleo\n'
                'Passo 5 — Colocar óleo na frigideira\n'
                'Passo 6 — Pegar o ovo\n'
                'Passo 7 — quebrar a casca\n'
                'Passo 8 — Colocar o ovo na frigideira\n'
                'Passo 9 — pegar sal\n'
                'Passo 10 — colocar sal no ovo\n'
                'Passo 11 — esperar fritar\n'
                'Passo 12 — pegar o ovo frito\n'
                'Passo 13 — colocar o ovo frito no prato\n\n'
                'Fim do algoritmo.\n\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.056,
                ),
              ),
            ),
          ),
          SizedBox(
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
                      Navigator.pop(context);
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
                                builder: (context) => const ConteudoLA5Page()),
                          );
                    },
                  ),
                ],
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
