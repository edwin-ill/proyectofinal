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
    final response = await http.get(Uri.parse('https://adamix.net/defensa_civil/def/servicios.php'));
    List<Servicios> servicios = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);

      for(var servicio in jsonData["datos"]){
        servicios.add(Servicios(servicio["nombre"], servicio["descripcion"], servicio["foto"]));
        
      }

      return servicios;
    } else {
      // Handle error based on status code
      throw Exception("Error de conexion");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicio'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla de Servicio'),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   listServices = _getServices();
  }
}
