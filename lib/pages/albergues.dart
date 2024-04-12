import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class AlberguesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador de Albergues',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlbergueListScreen(),
    );
  }
}

class AlbergueListScreen extends StatefulWidget {
  @override
  _AlbergueListScreenState createState() => _AlbergueListScreenState();
}

class _AlbergueListScreenState extends State<AlbergueListScreen> {
  late Future<List<Albergue>> futureAlbergues;
  late List<Albergue> albergues;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    futureAlbergues = fetchAlbergues();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscador de Albergues'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Albergue>>(
          future: futureAlbergues,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              albergues = snapshot.data!;
              return AlbergueListView(
                  albergues: albergues, searchController: _searchController);
            } else {
              return Text("No se encontraron albergues.");
            }
          },
        ),
      ),
    );
  }

  Future<List<Albergue>> fetchAlbergues() async {
    final response = await http
        .get(Uri.parse('https://adamix.net/defensa_civil/def/albergues.php'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as Map<String, dynamic>?;

      if (jsonResponse != null && jsonResponse.containsKey('datos')) {
        final List<dynamic> alberguesList = jsonResponse['datos'];
        return alberguesList
            .map((albergue) => Albergue.fromJson(albergue))
            .toList();
      } else {
        throw Exception('No se encontraron albergues.');
      }
    } else {
      throw Exception(
          'Error al cargar albergues. Código de estado: ${response.statusCode}');
    }
  }
}

class AlbergueListView extends StatefulWidget {
  final List<Albergue> albergues;
  final TextEditingController searchController;

  AlbergueListView({required this.albergues, required this.searchController});

  @override
  _AlbergueListViewState createState() => _AlbergueListViewState();
}

class _AlbergueListViewState extends State<AlbergueListView> {
  late List<Albergue> filteredAlbergues;

  @override
  void initState() {
    super.initState();
    filteredAlbergues = widget.albergues;
  }

  void filterAlbergues(String query) {
    setState(() {
      filteredAlbergues = widget.albergues
          .where((albergue) =>
              albergue.ciudad.toLowerCase().contains(query.toLowerCase()) ||
              albergue.edificio.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: widget.searchController,
            onChanged: (value) => filterAlbergues(value),
            decoration: InputDecoration(
              labelText: 'Buscar Albergues',
              hintText:
                  'Ingrese el nombre de la ciudad o el edificio del albergue',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredAlbergues.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredAlbergues[index].ciudad),
                subtitle: Text(filteredAlbergues[index].edificio),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlbergueDetailScreen(
                          albergue: filteredAlbergues[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class AlbergueDetailScreen extends StatelessWidget {
  final Albergue albergue;

  AlbergueDetailScreen({required this.albergue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(albergue.ciudad),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Código: ${albergue.codigo}'),
            Text('Edificio: ${albergue.edificio}'),
            Text('Coordinador: ${albergue.coordinador}'),
            Text('Teléfono: ${albergue.telefono}'),
            Text('Capacidad: ${albergue.capacidad}'),
            Text('Latitud: ${albergue.lat}'),
            Text('Longitud: ${albergue.lng}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
