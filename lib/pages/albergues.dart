import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlberguesScreen extends StatefulWidget {
  const AlberguesScreen({Key? key}) : super(key: key);

  @override
  _AlberguesScreenState createState() => _AlberguesScreenState();
}

class _AlberguesScreenState extends State<AlberguesScreen> {
  late List<Albergue> _albergues;
  late List<Albergue> _filteredAlbergues = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _loadAlbergues();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadAlbergues() async {
    final response = await http.get(
      Uri.parse('https://adamix.net/defensa_civil/def/albergues.php'),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> alberguesData = jsonResponse['datos'];
      _albergues =
          alberguesData.map((data) => Albergue.fromJson(data)).toList();
      _filteredAlbergues = List.from(_albergues);
      setState(() {});
    } else {
      // Error al cargar albergues
      // Manejar el error según sea necesario
    }
  }

  void _filterAlbergues(String query) {
    setState(() {
      _filteredAlbergues = _albergues
          .where((albergue) =>
              albergue.ciudad.toLowerCase().contains(query.toLowerCase()) ||
              albergue.edificio.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albergues', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFFF7000), // Orange color
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterAlbergues,
              decoration: InputDecoration(
                labelText: 'Buscar Albergues',
                hintText:
                    'Ingrese el nombre de la ciudad o el edificio del albergue',
                prefixIcon: Icon(Icons.search, color: Colors.blue),
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredAlbergues.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color(0xFF004C98), // Blue color
                  child: ListTile(
                    title: Text(_filteredAlbergues[index].ciudad,
                        style: TextStyle(color: Colors.white)),
                    subtitle: Text(_filteredAlbergues[index].edificio,
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlbergueDetailScreen(
                              albergue: _filteredAlbergues[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Albergue {
  final String ciudad;
  final String codigo;
  final String edificio;
  final String coordinador;
  final String telefono;
  final String capacidad;
  final double lat;
  final double lng;

  Albergue({
    required this.ciudad,
    required this.codigo,
    required this.edificio,
    required this.coordinador,
    required this.telefono,
    required this.capacidad,
    required this.lat,
    required this.lng,
  });

  factory Albergue.fromJson(Map<String, dynamic> json) {
    return Albergue(
      ciudad: json['ciudad'],
      codigo: json['codigo'],
      edificio: json['edificio'],
      coordinador: json['coordinador'],
      telefono: json['telefono'],
      capacidad: json['capacidad'],
      lat: double.parse(json['lat']),
      lng: double.parse(json['lng']),
    );
  }
}

class AlbergueDetailScreen extends StatelessWidget {
  final Albergue albergue;

  const AlbergueDetailScreen({Key? key, required this.albergue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Albergue',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFFF7000), // Orange color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Ciudad: ${albergue.ciudad}',
                style: TextStyle(color: Colors.black)),
            Text('Código: ${albergue.codigo}',
                style: TextStyle(color: Colors.black)),
            Text('Edificio: ${albergue.edificio}',
                style: TextStyle(color: Colors.black)),
            Text('Coordinador: ${albergue.coordinador}',
                style: TextStyle(color: Colors.black)),
            Text('Teléfono: ${albergue.telefono}',
                style: TextStyle(color: Colors.black)),
            Text('Capacidad: ${albergue.capacidad}',
                style: TextStyle(color: Colors.black)),
            Text('Latitud: ${albergue.lat}',
                style: TextStyle(color: Colors.black)),
            Text('Longitud: ${albergue.lng}',
                style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
