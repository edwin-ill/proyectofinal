import 'package:flutter/material.dart';
import 'package:proyectofinal/models/servicios.dart';
import 'package:http/http.dart';

class ServiciosScreen extends StatelessWidget {
  const ServiciosScreen({super.key});
 
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


  Future<List<Servicios>> _listServices;
  Future<List<Servicios>> _getServices() async{
    final response = await http.get(
    Uri.parse("https://reqres.in/api/users"),
    headers: {
    "Content-Type": "application/json",
    },
    );
    Map obj = jsonDecode(response.body);
  }

}

