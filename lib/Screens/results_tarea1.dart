import 'package:flutter/material.dart';
import 'package:tarea1dart/highscore.dart';
import 'package:tarea1dart/Screens/resolution_tarea1.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class resultadosJuego extends StatefulWidget {
  @override
  _PantallaResultados createState() => _PantallaResultados();
  resultadosJuego({super.key, required this.title, required this.score});
  final String title;
  int score;
}

int highestScore = 0;

const String ContentType = "application/json";
const String prefer = "return=minimal";

const String apiUrl =
    'https://qjfjhpyhfmixleoprqeo.supabase.co/rest/v1/Puntuacion';
const String apiKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFqZmpocHloZm1peGxlb3BycWVvIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5NjMyNjIxNiwiZXhwIjoyMDExOTAyMjE2fQ.3G-cRYrcvnjXvOKoy65NirTtD1NzxSPXWLPmXUUK77g';

List<String> highscores = [];

Future<List<String>> getPuntuaciones() async {
  final response = await http.get(
    Uri.parse('$apiUrl?select=*'),
    headers: {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
    },
  );
  List<dynamic> data = json.decode(response.body);
  List<String> scores = data.map<String>((score) {
    String name = score['Nombre'].toString();
    String scoreValue = score['Puntuacion'].toString();
    return '$name $scoreValue';
  }).toList();
  highscores.addAll(scores);
  return scores;
}

Future<void> publicarPuntuacion(String name, int score) async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Content-Type': ContentType,
      'Prefer': prefer
    },
    body: json.encode({'Nombre': name, 'Puntuacion': score}),
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to publish score');
  }
}

class _PantallaResultados extends State<resultadosJuego> {
  

  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cargarPuntuacion();
    setState(() {
     cargarPuntuaciones();
   });
    
  }

  Future<void> cargarPuntuacion() async {
    try {
      List<String> scores = await getPuntuaciones();
      setState(() {
        highscores = scores;
      });
    } catch (e) {
      print('Error loading scores: $e');
    }
  }


  Future<void> cargarPuntuaciones() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int savedHighestScore = prefs.getInt('highestScore') ?? 0;
    setState(() {
      highestScore = savedHighestScore;
    });
  }

  Future<void> guardarPuntuaciones(int puntos) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('highestScore', puntos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: highscores.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(highscores[index]),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                width: 600.0,
                child: Text(
                  "Tu puntacion es de : $score",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Nombre',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              HighScore highScore = HighScore(_nameController.text, score);
              // aqui hacemos POST
              publicarPuntuacion(highScore.name, highScore.score);
              setState(() {
                // Aquí hacer un GET
                getPuntuaciones();
                highscores
                    .add(highScore.name + " " + highScore.score.toString());
                if (score > highestScore) {
                  guardarPuntuaciones(score);
                }
              });
            },
            child: Text('Publicar resultado'),
          ),
        ],
      ),
    );
  }
}
