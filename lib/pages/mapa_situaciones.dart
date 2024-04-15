import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:latlong2/latlong.dart';

class MapaSituacionesScreen extends StatefulWidget {
  const MapaSituacionesScreen({Key? key}) : super(key: key);

  @override
  _MapaSituacionesScreenState createState() => _MapaSituacionesScreenState();
}

class _MapaSituacionesScreenState extends State<MapaSituacionesScreen> {
  List<Situacion> _situaciones = [];
  final String _token = "81e15c1e1f4189d4fc5c0d34650e4cd5";

  @override
  void initState() {
    super.initState();
    _fetchSituaciones();
  }

  Future<void> _fetchSituaciones() async {
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse('https://adamix.net/defensa_civil/def/situaciones.php'));

      request.fields.addAll({'token': _token});

      var response = await request.send();

      if (response.statusCode == 200) {
        final dynamic jsonData =
            json.decode(await response.stream.bytesToString());

        final List<dynamic> situacionesData = jsonData['datos'];

        setState(() {
          _situaciones =
              situacionesData.map((json) => Situacion.fromJson(json)).toList();
        });

        print('Coordenadas recibidas:');
        _situaciones.forEach((situacion) {
          print(
              'Latitud: ${situacion.latitud}, Longitud: ${situacion.longitud}');
        });
      } else {
        throw Exception('Failed to load situaciones');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mapa de situaciones',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFFF7000),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(18.479, -69.892),
          initialZoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: _situaciones
                .map((situacion) => Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(situacion.latitud, situacion.longitud),
                      child: _buildMarkerBuilder(context, situacion),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Future<void> _showSituacionDetailsDialog(
      BuildContext context, Situacion situacion) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Detalles de la Situación'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Título: ${situacion.titulo}'),
            Text('Descripción: ${situacion.descripcion}'),
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

  Widget _buildMarkerBuilder(BuildContext ctx, Situacion situacion) {
    return IconButton(
      icon: const Icon(Icons.location_on),
      onPressed: () {
        _showSituacionDetailsDialog(context, situacion);
      },
    );
  }
}

class Situacion {
  final String id;
  final String voluntario;
  final String titulo;
  final String descripcion;
  final String foto;
  final double latitud;
  final double longitud;
  final String estado;
  final String fecha;

  Situacion({
    required this.id,
    required this.voluntario,
    required this.titulo,
    required this.descripcion,
    required this.foto,
    required this.latitud,
    required this.longitud,
    required this.estado,
    required this.fecha,
  });

  factory Situacion.fromJson(Map<String, dynamic> json) {
    return Situacion(
      id: json['id'],
      voluntario: json['voluntario'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      foto: json['foto'],
      latitud: double.parse(json['latitud']),
      longitud: double.parse(json['longitud']),
      estado: json['estado'],
      fecha: json['fecha'],
    );
  }
}
