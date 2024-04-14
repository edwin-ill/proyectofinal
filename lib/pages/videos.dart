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
          title: const Text('Videos'),
        ),
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
              children: [
                // Widget para mostrar la imagen
                SizedBox(
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

                // Widget para mostrar el nombre del servicio
                Text(
                  video.titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  video.fecha,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                // Widget para mostrar la descripción del servicio
                Text(
                  video.contenido,
                  style: const TextStyle(
                    fontSize: 14,
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
