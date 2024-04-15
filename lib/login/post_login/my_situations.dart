import 'package:flutter/material.dart';
import 'package:proyectofinal/api/obtener_reporte.dart';
import 'package:proyectofinal/db/dbhelper.dart';
import 'package:proyectofinal/db/report.dart';
import 'package:proyectofinal/pages/detalles_situacion_screen.dart';
import 'package:proyectofinal/widgets/situacion_card.dart';

class MySituations extends StatefulWidget {
  final String token;
  const MySituations({Key? key, required this.token}) : super(key: key);

  @override
  State<MySituations> createState() => _MySituationsState();
}

class _MySituationsState extends State<MySituations> {
  ReportManager reportManager = ReportManager(dbHelper: DbHelper());

  List<dynamic> reports = [];
  bool hasReports = false;

  @override
  void initState() {
    super.initState();
    getReports(widget.token);
  }

  Future<void> getReports(String token) async {
    try {
      final retrievedReports = await ObternerReporte().obtenerReporte(
          'https://adamix.net/defensa_civil/def/situaciones.php',
          {'token': token});

      setState(() {
        if (retrievedReports.isNotEmpty) {
          hasReports = true;
          reports = retrievedReports;
        } else {
          hasReports = false;
        }
      });
    } catch (e) {
      print('Error fetching reports: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Situaciones'),
      ),
      body: Visibility(
        visible: hasReports,
        child: SizedBox(
          child: ListView.builder(
            itemCount: reports.length,
            itemBuilder: (context, index) {
              return SituacionCard(
                report: Report.fromMap(reports[index - 1]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetallesSituacionScreen(
                        report: Report.fromMap(reports[index - 1]),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class ReportManager {
  final DbHelper dbHelper;

  ReportManager({required this.dbHelper});

  Future<List<dynamic>> getReports(String token) async {
    return await dbHelper.getReports(token);
  }
}
