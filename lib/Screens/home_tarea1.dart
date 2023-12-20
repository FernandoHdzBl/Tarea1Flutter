import 'package:flutter/material.dart';
import 'package:tarea1dart/Widgets/boton_tarea1.dart';
import 'package:tarea1dart/Widgets/imagen_tarea1.dart';
import 'package:tarea1dart/Widgets/texto_tarea1.dart';
import 'package:tarea1dart/Screens/game_tarea1.dart';
import 'package:tarea1dart/Screens/results_tarea1.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomePage();
}

class _HomePage extends State<Home> {
  botonPulsado() {
    print("Metodo!");
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => pantallaJuego(title: 'gameScreen')));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(centerTitle: true, title: Text("The One Memory")),
            persistentFooterAlignment: AlignmentDirectional.center,
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Image(
                    image: ImageAsset.getLogo(),
                    // Additional image properties can be set here
                    fit: BoxFit.contain,
                    height: 800,
                    width: 800,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 80),
                  CustomButton(onPressed: botonPulsado),
                  const SizedBox(height: 50),
                  BestResultWidget(highestScore)
                ]))));
  }
}