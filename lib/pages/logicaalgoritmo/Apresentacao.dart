import 'package:flutter/material.dart';

class ApresentacaoPage extends StatelessWidget {
  const ApresentacaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1), // 10% of screen height
        child: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.02), // 2% of screen height
            child: Text(
              'Apresentação',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Varela Round',
                fontSize: screenWidth * 0.06, // 6% of screen width
              ),
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // 2% of screen height
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: screenWidth * 0.08, // 8% of screen width
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (orientation == Orientation.portrait) {
                  // Código para layout em retrato
                  return Container(
                    height: constraints.maxHeight * 0.73,
                    color: const Color(0xFF453650),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(18.0), // Add some padding around the text
                      child: Text(
                        'Afinal o que é um programa?\n\n'
                        'Instruções!\n'
                        'Um programa é um conjunto de instruções que uma máquina pode seguir para realizar tarefas, e programação é o processo de escrever, testar e manter essas instruções. Para isso usamos a linguagem de programação, existem diversas linguagens de programação, como o C + + por exemplo. Ela fará o intermédio entre o ser humano e a máquina, pois o código pode ser escrito pelo programador e entendido pela máquina, e assim podemos criar nosso programa que é um dos passos para criar um software como os aplicativos do seu celular, computador, e esse aplicativo em que você está agora 🙂.\n\n'
                        'A partir daqui, se inicia o primeiro módulo, Lógica de programação e algoritmo.',
                        style: TextStyle(
                          fontSize: screenWidth * 0.043, // 4,3% of screen width
                          color: Colors.white, // Set text color to white
                          fontFamily: 'Varela Round', // Set font family to Varela Round
                        ),
                      ),
                    ),
                  );
                } else {
                  // Código para layout em paisagem
                  // Reutilizando o mesmo layout do modo retrato
                  return Container(
                    height: constraints.maxHeight * 0.73,
                    color: const Color(0xFF453650),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(18.0), // Add some padding around the text
                      child: Text(
                        'Afinal o que é um programa?\n\n'
                        'Instruções!\n'
                        'Um programa é um conjunto de instruções que uma máquina pode seguir para realizar tarefas, e programação é o processo de escrever, testar e manter essas instruções. Para isso usamos a linguagem de programação, existem diversas linguagens de programação, como o C + + por exemplo. Ela fará o intermédio entre o ser humano e a máquina, pois o código pode ser escrito pelo programador e entendido pela máquina, e assim podemos criar nosso programa que é um dos passos para criar um software como os aplicativos do seu celular, computador, e esse aplicativo em que você está agora 🙂.\n\n'
                        'A partir daqui, se inicia o primeiro módulo, Lógica de programação e algoritmo.',
                        style: TextStyle(
                          fontSize: screenWidth * 0.043, // 4,3% of screen width
                          color: Colors.white, // Set text color to white
                          fontFamily: 'Varela Round', // Set font family to Varela Round
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Container(
            height: screenHeight * 0.25,
            color: Colors.black,
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF453650)), // cor do botão
                  fixedSize: MaterialStateProperty.all(Size(screenWidth * 0.375, screenHeight * 0.110)), // largura e altura do botão
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18), // corner radius
                    ),
                  ),
                ),
                onPressed: () {
                  // Ação ao pressionar o botão
                },
                child: Text(
                  'Iniciar',
                  style: TextStyle(
                    color: Colors.white, // cor do texto
                    fontSize: screenWidth * 0.060, // tamanho do texto
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
