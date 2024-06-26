import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proyectofinal/models/noticias.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class NoticiasScreen extends StatefulWidget {
  const NoticiasScreen({super.key});

  @override
  State<NoticiasScreen> createState() => _NoticiasScreenState();
}

class _NoticiasScreenState extends State<NoticiasScreen> {
  late Future<List<Noticias>> listNoticias;
  Future<List<Noticias>> _getNoticias() async {
    final response = await http
        .get(Uri.parse('https://adamix.net/defensa_civil/def/noticias.php'));
    List<Noticias> noticias = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var noticia in jsonData["datos"]) {
        print(noticia["fecha"]);
        noticias.add(
          Noticias(noticia["titulo"], noticia["fecha"], noticia["contenido"],
              noticia["foto"]),
        );
        print(noticia[1]);
      }
      return noticias;
    } else {
      print("No hubo conexion");
      // Handle error based on status code
      throw Exception("Error de conexions");
    }
  }

  @override
  void initState() {
    super.initState();
    listNoticias = _getNoticias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Noticias',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 255, 111, 0)),
      body: FutureBuilder(
        future: listNoticias,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: listNoticiasAPI(snapshot.data!),
            );
          } else if (snapshot.hasError) {
            return const Text("Error de conexionsss");
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  List<Widget> listNoticiasAPI(List<Noticias> noticias) {
    List<Widget> listOfNoticias = [];
    for (var noticia in noticias) {
      listOfNoticias.add(
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget para mostrar la imagen
                Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Image.network(noticia.foto)),

                // Widget para mostrar el nombre del servicio

                
                Container(
               margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    noticia.titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004C98),
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Fecha: ${noticia.fecha}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 230, 108, 21),
                      fontSize: 12,
                    ),
                  ),
                ),
                // Widget para mostrar la descripción del servicio
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    noticia.contenido,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return listOfNoticias;
  }
}
