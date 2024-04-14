import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MiembrosScreen extends StatefulWidget {
  const MiembrosScreen({super.key});

  @override
  _MiembrosScreenState createState() => _MiembrosScreenState();
}

class _MiembrosScreenState extends State<MiembrosScreen> {
  late Future<List<Miembro>> futureMiembros;

  @override
  void initState() {
    super.initState();
    futureMiembros = fetchMiembros();
  }

  Future<List<Miembro>> fetchMiembros() async {
    final response = await http
        .get(Uri.parse('https://adamix.net/defensa_civil/def/miembros.php'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> miembrosList = jsonResponse['datos'];

      return miembrosList.map((miembro) => Miembro.fromJson(miembro)).toList();
    } else {
      throw Exception('Failed to load miembros');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Miembros',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFF7000),
      ),
      body: FutureBuilder<List<Miembro>>(
        future: futureMiembros,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final miembros = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: miembros.length,
              itemBuilder: (context, index) {
                final miembro = miembros[index];
                return IgnorePointer(
                  ignoring: true,
                  child: Card(
                    elevation: 4,
                    color: const Color(0xFF004C98),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: miembro.foto != null
                              ? Image.network(
                                  miembro.foto!,
                                  fit: BoxFit.cover,
                                )
                              : const Placeholder(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                miembro.nombre,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                miembro.cargo,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No se encontraron miembros'));
          }
        },
      ),
    );
  }
}

class Miembro {
  final String id;
  final String? foto;
  final String nombre;
  final String cargo;

  Miembro({
    required this.id,
    required this.nombre,
    required this.cargo,
    this.foto,
  });

  factory Miembro.fromJson(Map<String, dynamic> json) {
    return Miembro(
      id: json['id'],
      foto: json['foto'],
      nombre: json['nombre'],
      cargo: json['cargo'],
    );
  }
}
