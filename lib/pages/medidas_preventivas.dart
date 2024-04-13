import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MedidasPreventivasScreen extends StatefulWidget {
  const MedidasPreventivasScreen({Key? key}) : super(key: key);

  @override
  _MedidasPreventivasScreenState createState() =>
      _MedidasPreventivasScreenState();
}

class _MedidasPreventivasScreenState extends State<MedidasPreventivasScreen> {
  late Future<List<MedidaPreventiva>> futureMedidas;

  @override
  void initState() {
    super.initState();
    futureMedidas = fetchMedidas();
  }

  Future<List<MedidaPreventiva>> fetchMedidas() async {
    final response = await http.get(Uri.parse(
        'https://adamix.net/defensa_civil/def/medidas_preventivas.php'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      final medidasList = jsonResponse['datos'] as List<dynamic>;

      return medidasList
          .map((medida) => MedidaPreventiva.fromJson(medida))
          .toList();
    } else {
      throw Exception('Failed to load medidas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medidas preventivas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFF7000),
      ),
      body: FutureBuilder<List<MedidaPreventiva>>(
        future: futureMedidas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final medidas = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: medidas.length,
              itemBuilder: (context, index) {
                final medida = medidas[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MedidaPreventivaDetailScreen(medida: medida),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    color: const Color(0xFF004C98),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: medida.foto != null
                              ? Image.network(
                                  medida.foto!,
                                  fit: BoxFit.cover,
                                )
                              : const Placeholder(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            medida.titulo,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No se encontraron medidas'));
          }
        },
      ),
    );
  }
}

class MedidaPreventivaDetailScreen extends StatelessWidget {
  final MedidaPreventiva medida;

  const MedidaPreventivaDetailScreen({required this.medida});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          medida.titulo,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFF7000),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Descripción:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(medida.descripcion),
            const SizedBox(height: 16),
            if (medida.foto != null)
              Image.network(
                medida.foto!,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}

class MedidaPreventiva {
  final String id;
  final String titulo;
  final String descripcion;
  final String? foto;

  MedidaPreventiva({
    required this.id,
    required this.titulo,
    required this.descripcion,
    this.foto,
  });

  factory MedidaPreventiva.fromJson(Map<String, dynamic> json) {
    return MedidaPreventiva(
      id: json['id'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      foto: json['foto'],
    );
  }
}
