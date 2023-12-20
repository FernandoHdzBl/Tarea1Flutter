import 'package:flutter/material.dart';
import 'package:tarea1dart/Screens/resolution_tarea1.dart';

class pantallaJuego extends StatefulWidget {
  pantallaJuego({super.key, required this.title});
  final String title;

  @override
  State<pantallaJuego> createState() => _pantallaJuego();
}

List<int> numerosRandom = [];

// ignore: camel_case_types
class _pantallaJuego extends State<pantallaJuego> {
  int i = 0;

  final imagenes = <String>[
    'imagenes/luffy.png',
    'imagenes/zoro.png',
    'imagenes/king.png',
    'imagenes/sanji.png',
    'imagenes/shiro.png',
    'imagenes/mihawk.png'
  ];

  List<int> getShuffledNumbers() {
    List<int> numbers = [0, 1, 2, 3, 4, 5];
    numbers.shuffle();
    return numbers;
  }

  void initState() {
    super.initState();
    numerosRandom = getShuffledNumbers();
    print(numerosRandom);
  }

  pasarFoto() {
    if (i < imagenes.length - 1) {
      setState(() {
        i++;
      });
    } else if (i == imagenes.length - 1) {
      numerosRandom.shuffle();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => resolucion(title: 'Resolution', shuffledNumbers: numerosRandom)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("The One Memory Project")),
      persistentFooterAlignment: AlignmentDirectional.center,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Image(
                image: AssetImage(imagenes[numerosRandom[i]]),
                height: 350,
                width: 350),
            FloatingActionButton(
                onPressed: pasarFoto, child: Icon(Icons.arrow_forward_rounded))
          ])),
    );
  }
}