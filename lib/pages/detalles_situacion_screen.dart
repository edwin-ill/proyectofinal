import 'package:flutter/material.dart';
import 'package:proyectofinal/db/report.dart';
import 'package:proyectofinal/widgets/custom_appbar.dart';

class DetallesSituacionScreen extends StatelessWidget {
  final Report report;

  const DetallesSituacionScreen({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Detalles de la Situación',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text('Código de Identificación: ${report.id}'),
            Text('Fecha de Reporte: ${report.date}'),
            Text('Título: ${report.title}'),
            Text('Descripción: ${report.description}'),
            // Image.network(situacion.foto),
            Text('Estado: ${report.state == 1 ? 'Resuelto': 'En proceso'}'),
            Text('Comentarios: ${report.feedback}'),
          ],
        ),
      ),
    );
  }
}
