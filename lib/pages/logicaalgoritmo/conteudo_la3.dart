import 'package:epp/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'conteudo_la4.dart';
import 'package:epp/pages/bottom_pages/bottom_bar.dart';


class ConteudoLA3Page extends StatelessWidget {
  const ConteudoLA3Page({super.key});

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
                'Fazendo um lanche:\n\n'
                'Passo 1 — Pegar o pão\n'
                'Passo 2 — Cortar o pão ao meio\n'
                'Passo 3 — Pegar o ketchup\n'
                'Passo 4 — Passar o ketchup no pão\n'
                'Passo 5 — Pegar e cortar alface\n'
                'Passo 6 — Colocar alface\n'
                'Passo 7 — Pegar o hambúrguer\n'
                'Passo 8 — Fritar o hambúrguer\n'
                'Passo 9 — Colocar o hambúrguer no pão\n\n'
                'Fim do algoritmo.\n\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.054,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 20.0, bottom: 20.0), // Adicionado right: 20.0
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Próximo exemplo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.060,
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
                            builder: (context) => const ConteudoLA4Page()),
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