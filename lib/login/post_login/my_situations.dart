import 'package:flutter/material.dart';
import 'package:proyectofinal/api/inscripcion.dart';
import 'package:proyectofinal/api/obtener_reporte.dart';
import 'package:proyectofinal/db/dbhelper.dart';
import 'package:proyectofinal/db/report.dart';
import 'package:proyectofinal/pages/detalles_situacion_screen.dart';
import 'package:proyectofinal/widgets/situacion_card.dart';

class MySituations extends StatefulWidget {
  const MySituations({super.key});

  @override
  State<MySituations> createState() => _MySituationsState();
}

class _MySituationsState extends State<MySituations> {
  ReportManager reportManager = ReportManager(dbHelper: DbHelper());
  TextEditingController cedula = TextEditingController();
  TextEditingController contr = TextEditingController();
  Incripcion? ic;
  List? user;

  List<dynamic> reports = [];
  bool hasReports = false;

  Future<void> deleteReport(int id) async {
    // await reportManager.deleteReport(id);
    // getReports();
  }

  Future<String> getToken() async {
    ic = Incripcion();
    user = await ic?.enviarIncripcion(
        'https://adamix.net/defensa_civil/def/iniciar_sesion.php',
        {'clave': contr.text, 'cedula': cedula.text});
    return user![1];
  }

  Future<void> getReports(String token) async {
    final retrievedReport = await reportManager.getReports(token);
    setState(() {
      if (retrievedReport.isNotEmpty) {
        hasReports = true;
        reports = retrievedReport;
      } else {
        hasReports = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Situaciones'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: cedula,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: false, signed: true),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              labelText: 'Cedula',
            ),
          ),
          TextFormField(
            controller: contr,
            keyboardType: const TextInputType.numberWithOptions(
                decimal: false, signed: true),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              labelText: 'Contraseña',
            ),
          ),
          ElevatedButton(
              onPressed: () async => {
                    reports = await ObternerReporte().obtenerReporte(
                        'https://adamix.net/defensa_civil/def/situaciones.php',
                        {'token': await getToken()}),
                    setState(() {
                      hasReports = true;
                    })
                  },
              child: Text('enviar')),
          Visibility(
            visible: hasReports,
            child: SizedBox(
              child: ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  return SituacionCard(
                    report: Report.fromMap(reports[index - 1]),
                    onTap: () {
                      // Acción al hacer clic en la tarjeta, por ejemplo, mostrar más detalles
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
        ],
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

  // Future<void> deleteReport(int id) async {
  //   await dbHelper.deleteReport(id);
  // }
}
