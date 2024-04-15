import 'package:flutter/material.dart';
import 'package:proyectofinal/models/videos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late Future<List<Videos>> galeria;
  Future<List<Videos>> _getGaleria() async {
    final response = await http
        .get(Uri.parse('https://adamix.net/defensa_civil/def/videos.php'));
    List<Videos> videos = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for (var video in jsonData["datos"]) {
        videos.add(
          Videos(video["titulo"], video["fecha"], video["descripcion"],
              video["link"]),
        );
      }
      return videos;
    } else {
      // Handle error based on status code
      throw Exception("Error de conexion 404");
    }
  }

  @override
  void initState() {
    super.initState();
    galeria = _getGaleria();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Videos',style: TextStyle(color: Colors.white),),
            backgroundColor: Color.fromARGB(255, 255, 111, 0)),
        body: FutureBuilder(
          future: galeria,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: galeriaVideos(snapshot.data!),
              );
            } else if (snapshot.hasError) {
              return const Text("Error de conexion");
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  List<Widget> galeriaVideos(videos) {
    List<Widget> listVideos = [];
    for (var video in videos) {
      listVideos.add(
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget para mostrar la imagen
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: SizedBox(
                    height: 200,
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: video.link,
                        flags: YoutubePlayerFlags(
                          autoPlay: false,
                          mute: false,
                        ),
                      ),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.blueAccent,
                    ),
                  ),
                ),

                // Widget para mostrar el nombre del servicio
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    video.titulo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004C98),
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Fecha: ${video.fecha}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 230, 108, 21),
                      fontSize: 14,
                    ),
                  ),
                ),
                // Widget para mostrar la descripción del servicio
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text(
                    video.contenido,
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
    return listVideos;
  }
}
