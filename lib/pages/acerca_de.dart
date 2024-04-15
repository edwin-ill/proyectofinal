import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  const AcercaDeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFFF7000),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDeveloperCard(
            name: 'Jean Marco Marte Rivera',
            studentId: '2022-0590',
            phoneNumber: '829-906-9256',
          ),
          _buildDeveloperCard(
            name: 'Christopher Manzueta',
            studentId: '2022-0207',
            phoneNumber: '849-401-5923',
          ),
          _buildDeveloperCard(
            name: 'Jhonjansel De Jesús Hilario Torres',
            studentId: '2019-8234',
            phoneNumber: '829-942-8599',
          ),
          _buildDeveloperCard(
            name: 'Edwin Paredes Hidalgo',
            studentId: '2022-0723',
            phoneNumber: '829-308-8166',
          ),
        ],
      ),
    );
  }

  Widget _buildDeveloperCard({
    required String name,
    required String studentId,
    required String phoneNumber,
  }) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      color: const Color(0xFF004C98),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Matrícula: $studentId',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Teléfono: $phoneNumber',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
