// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proyectofinal/models/servicios.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ServiciosScreen extends StatefulWidget {
  const ServiciosScreen({super.key});

  @override
  State<ServiciosScreen> createState() => _ServiciosScreenState();
}

class _ServiciosScreenState extends State<ServiciosScreen> {
  late Future<List<Servicios>> listServices;

  // ignore: unused_element
  Future<List<Servicios>> _getServices() async {
    final response = await http
        .get(Uri.parse('https://adamix.net/defensa_civil/def/servicios.php'));
    List<Servicios> servicios = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      for (var servicio in jsonData["datos"]) {
        servicios.add(Servicios(
            servicio["nombre"], servicio["descripcion"], servicio["foto"]));
      }

      return servicios;
    } else {
      // Handle error based on status code
      throw Exception("Error de conexion");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listServices = _getServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Servicios',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 255, 111, 0)),
      body: FutureBuilder(
        future: listServices,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: listServicesAPI(snapshot.data!),
            );
          } else if (snapshot.hasError) {
            return Text("Error de conexion");
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  List<Widget> listServicesAPI(List<Servicios> services) {
    List<Widget> listOfServices = [];
    for (var service in services) {
      listOfServices.add(
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Widget para mostrar la imagen
                Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: Image.network(service.image)),

                // Widget para mostrar el nombre del servicio
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text(
                    service.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004C98),
                      fontSize: 22,
                    ),
                  ),
                ),

                // Widget para mostrar la descripción del servicio
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text(
                    service.description,
                    style: TextStyle(
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

    return listOfServices;
  }
}
