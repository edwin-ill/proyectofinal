import 'package:flutter/material.dart';
import 'package:proyectofinal/widgets/custom_appbar.dart';
import 'package:proyectofinal/pages/mis_situaciones_screen.dart';

class DetallesSituacionScreen extends StatelessWidget {
  final Situacion situacion;

  DetallesSituacionScreen({required this.situacion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Detalles de la Situación',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text('Código de Identificación: ${situacion.codigo}'),
            Text('Fecha de Reporte: ${situacion.fecha}'),
            Text('Título: ${situacion.titulo}'),
            Text('Descripción: ${situacion.descripcion}'),
            // Image.network(situacion.foto), 
            Text('Estado: ${situacion.estado}'),
            Text('Comentarios: ${situacion.comentarios}'),
          ],
        ),
      ),
    );
  }
  }