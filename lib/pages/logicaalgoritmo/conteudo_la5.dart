import 'package:epp_firebase/pages/logicaalgoritmo/exercicio_la.dart';
import 'package:flutter/material.dart';
import 'package:epp_firebase/pages/bottom_pages/bottom_bar.dart';



class ConteudoLA5Page extends StatelessWidget {
  const ConteudoLA5Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
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
            child: Container(
              color: const Color(0xFF453650),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Você pode ter pensado que faz que algo diferente dos exemplos, esse pensamento está correto, na programação podemos fazer algoritmos diferentes para resolver um mesmo problema, mas o que ainda vale aqui é se a ordem tem sentido e lógica para chegar onde queremos com precisão, se sim, está tudo bem!\n\n'
                  'Nos algoritmos, a precisão e a ordem importam. Se você misturar os passos de maneira que não fazem sentido, o resultado pode não ser o esperado, o mesmo vale na programação.\n\n'
                  'A seguir você fará um exercício baseado no que você acabou de ler.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.047,
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
                      builder: (context) => const ExercicioLAPage(),
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
                              builder: (context) => const BottomBar()),
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
