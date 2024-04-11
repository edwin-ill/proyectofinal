import 'package:flutter/material.dart';

class VoluntarioScreen extends StatelessWidget {
  const VoluntarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voluntario'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla de Voluntario'),
      ),
    );
  }
}
