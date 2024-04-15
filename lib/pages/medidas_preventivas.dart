import 'package:flutter/material.dart';

class MedidasPreventivasScreen extends StatelessWidget {
  const MedidasPreventivasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medidas preventivas',style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 255, 111, 0)
      ),
      body: const Center(
        child: Text('Contenido de la pantalla de Medidas preventivas'),
      ),
    );
  }
}
