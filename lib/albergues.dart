import 'package:flutter/material.dart';

class AlberguesScreen extends StatelessWidget {
  const AlberguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albergues'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla de Albergues'),
      ),
    );
  }
}
