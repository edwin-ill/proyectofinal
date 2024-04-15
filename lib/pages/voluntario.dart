import 'package:flutter/material.dart';

class VoluntarioScreen extends StatelessWidget {
  const VoluntarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Voluntario'),
          backgroundColor: Color.fromARGB(255, 255, 111, 0)),
      body: const Center(
        child: Text('Contenido de la pantalla de Voluntario', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
