import 'package:flutter/material.dart';
import 'package:proyectofinal/api/inscripcion.dart';
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
  String? token;

  List<Map<String, dynamic>> reports = [];
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
        cedula.text = '';
        contr.text = '';
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
                    // reports = await ObtenerReporte().obtenerReporte(
                    //     'https://adamix.net/defensa_civil/def/situaciones.php',
                    //     {'token': await getToken()}),
                    token = await getToken(),
                    await getReports(token!),
                    // setState(() {
                    //   hasReports = true;
                    // })
                  },
              child: Text('enviar')),
          Visibility(
            visible: hasReports,
            child: Expanded(
              child: ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  // return Text(reports[index].toString());
                  Map item = reports[index];
                  Report rt = Report(
                      id: int.parse(item['id']),
                      title: item['titulo'],
                      date: item['fecha'],
                      description: item['descripcion'],
                      latitude: int.parse(item['latitud']),
                      longitude: int.parse(item['longitud']),
                      state: 0,
                      photo: item['foto'],
                      feedback: '',
                      token: '',
                      contr: '');
                  return SituacionCard(
                    report: rt,
                    onTap: () {
                      // Acción al hacer clic en la tarjeta, por ejemplo, mostrar más detalles
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetallesSituacionScreen(
                            report: rt,
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

  Future<List<Map<String, dynamic>>> getReports(String token) async {
    return await dbHelper.getReports(token);
  }

  // Future<void> deleteReport(int id) async {
  //   await dbHelper.deleteReport(id);
  // }
}
