import 'package:epp_firebase/controller/login_controller.dart';
import 'package:epp_firebase/pages/logicaalgoritmo/Apresentacao_la.dart';
import 'package:flutter/material.dart';
import 'package:epp_firebase/pages/bottom_pages/bottom_bar.dart';

class ConclusaoLAPage extends StatelessWidget {
  const ConclusaoLAPage({Key? key}) : super(key: key);

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
              'Conclusão',
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
                  'Parabéns, você organizou o algoritmo de maneira que faz sentido e lógica para chegar a onde queriamos, uma xicara de café ☕, 5 pontos foram acrescentados a seu perfil. Em conclusão, podemos entender que a lógica de programação começa com essa habilidade de criar algoritmos. É sobre aprender a quebrar problemas em passos compreensíveis para chegar onde você precisa.\n\n'
                  'No próximo módulo, se estuda mais algoritmos, porém entendendo como seriam implementados em um programa real e dentro da estrutura de C++. Para isso, começariamos com pseudocódigo antes de passarmos para a linguagem propriamente dita.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
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
              child: Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF453650)),
                      fixedSize: MaterialStateProperty.all(
                          Size(screenWidth * 0.400, screenHeight * 0.110)),
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
                          builder: (context) => Builder(
                            builder: (context) {
                              return BottomBar(firebaseService: firebaseService,);
                            },
                          ),
                        ),
                      );

                                            showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Parabéns!'),
                            content: const Text(
                                'Você completou o Módulo 1 e ganhou 5 pontos!'),
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
                    },
                    child: Text(
                      'Finalizar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.060,
                      ),
                    ),
                  );
                },
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
