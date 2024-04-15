import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latlong2/latlong.dart';

class MapaAlberguesScreen extends StatefulWidget {
  const MapaAlberguesScreen({Key? key}) : super(key: key);

  @override
  _MapaAlberguesScreenState createState() => _MapaAlberguesScreenState();
}

class _MapaAlberguesScreenState extends State<MapaAlberguesScreen> {
  List<Albergue> _albergues = [];

  @override
  void initState() {
    super.initState();
    _fetchAlbergues();
  }

  Future<void> _fetchAlbergues() async {
    final response = await http
        .get(Uri.parse('https://adamix.net/defensa_civil/def/albergues.php'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> alberguesData = data['datos'];

      setState(() {
        _albergues =
            alberguesData.map((json) => Albergue.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load albergues');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Mapa albergues', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFFF7000),
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(18.479, -69.892),
          initialZoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: _albergues
                .map((albergue) => Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(albergue.lng, albergue.lat),
                    child: _buildMarkerBuilder(context, albergue)))
                .toList(),
          ),
        ],
      ),
    );
  }

  Future<void> _showAlbergueDetailsDialog(
      BuildContext context, Albergue albergue) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Detalles del Albergue'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ciudad: ${albergue.ciudad}'),
            Text('Edificio: ${albergue.edificio}'),
            Text('Coordinador: ${albergue.coordinador}'),
            Text('Teléfono: ${albergue.telefono}'),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  Widget _buildMarkerBuilder(BuildContext ctx, Albergue albergue) {
    return IconButton(
      icon: const Icon(Icons.location_on),
      onPressed: () {
        _showAlbergueDetailsDialog(context, albergue);
      },
    );
  }
}

class Albergue {
  final String ciudad;
  final String edificio;
  final String coordinador;
  final String telefono;
  final String capacidad;
  final double lat;
  final double lng;

  Albergue({
    required this.ciudad,
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
      edificio: json['edificio'],
      coordinador: json['coordinador'],
      telefono: json['telefono'],
      capacidad: json['capacidad'],
      lat: double.parse(json['lat']),
      lng: double.parse(json['lng']),
    );
  }
}
