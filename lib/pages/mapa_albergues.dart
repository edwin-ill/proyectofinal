import 'package:flutter/material.dart';

class MapaAlberguesScreen extends StatelessWidget {
  const MapaAlberguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa albergues',style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 255, 111, 0)
      ),
      body: const Center(
        child: Text('Contenido de la pantalla de Mapa albergues'),
      ),
    );
  }
}
