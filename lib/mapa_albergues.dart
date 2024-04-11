import 'package:flutter/material.dart';

class MapaAlberguesScreen extends StatelessWidget {
  const MapaAlberguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa albergues'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla de Mapa albergues'),
      ),
    );
  }
}
