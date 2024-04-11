import 'package:flutter/material.dart';

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
}
