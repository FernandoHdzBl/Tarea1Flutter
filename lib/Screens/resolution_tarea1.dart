import 'package:flutter/material.dart';
import 'package:tarea1dart/Screens/game_tarea1.dart';
import 'package:tarea1dart/Screens/results_tarea1.dart';

class resolucion extends StatefulWidget {
  resolucion(
      {super.key, required this.title, required this.shuffledNumbers});
  final String title;
  List<int> shuffledNumbers;
  @override
  State<resolucion> createState() => screenresolver();
}

int score = 0;

// ignore: camel_case_types
class screenresolver extends State<resolucion> {
  TextEditingController textFieldController1 = TextEditingController();
  TextEditingController textFieldController2 = TextEditingController();
  TextEditingController textFieldController3 = TextEditingController();
  TextEditingController textFieldController4 = TextEditingController();
  TextEditingController textFieldController5 = TextEditingController();
  TextEditingController textFieldController6 = TextEditingController();
  int respuesta0 = 0;
  int respuesta1 = 0;
  int respuesta2 = 0;
  int respuesta3 = 0;
  int respuesta4 = 0;
  int respuesta5 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The One Memory'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageText(
                    'imagenes/king.png', textFieldController1),
                ImageText(
                    'imagenes/luffy.png', textFieldController2),
                ImageText(
                    'imagenes/mihawk.png', textFieldController3),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageText(
                    'imagenes/sanji.png', textFieldController4),
                ImageText(
                    'imagenes/zoro.png', textFieldController5),
                ImageText(
                    'imagenes/shiro.png', textFieldController6),
              ],
            ),
            SizedBox(height: 52.0),
            Align(
              alignment: Alignment.center,
              child: Container(
                  width: 600.0,
                  child: const Text(
                    "Ordena las imagenes en el orden en el que han salido",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  )),
            ),
            SizedBox(height: 38.0),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 190.0,
                child: ElevatedButton(
                  onPressed: () {
                    List<int> respuestas = [
                      respuesta0,
                      respuesta1,
                      respuesta2,
                      respuesta3,
                      respuesta4,
                      respuesta5
                    ];
                    respuesta0 = int.parse(textFieldController1.text);
                    respuesta1 = int.parse(textFieldController2.text);
                    respuesta2 = int.parse(textFieldController3.text);
                    respuesta3 = int.parse(textFieldController4.text);
                    respuesta4 = int.parse(textFieldController5.text);
                    respuesta5 = int.parse(textFieldController6.text);
                    for (int i = 0; i < numerosRandom.length; i++) {
                      if (respuestas[i] == (numerosRandom.indexOf(0) + 1)) {
                        score += 100;
                      } else {
                        score -= 50;
                      }
                    }
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => resultadosJuego(
                              title: "Results",
                              score: score,
                            )));
                  },
                  child: Text('Resolver'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ImageText(
      String imagePath, TextEditingController controller) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          height: 150.0,
          width: 180.0,
        ),
        SizedBox(height: 8.0),
        Container(
          width: 120.0,
          child: TextField(controller: controller),
        ),
      ],
    );
  }
}
