import 'package:flutter/material.dart';

class IniciarSesionScreen extends StatelessWidget {
  const IniciarSesionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesion'),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla de Iniciar Sesion'),
      ),
    );
  }
}
