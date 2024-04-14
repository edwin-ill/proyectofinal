import 'package:flutter/material.dart';
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
  List<Map<String, dynamic>> reports = [];
  bool hasReports = false;

  @override
  void initState() {
    getReports();
    super.initState();
  }

  Future<void> deleteReport(int id) async {
    await reportManager.deleteReport(id);
    getReports();
  }

  Future<void> getReports() async {
    final retrievedReport = await reportManager.getReports();
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
      body: Visibility(
        visible: hasReports,
        child: ListView.builder(
          itemCount: reports.length,
          itemBuilder: (context, index) {
            return SituacionCard(
              report: Report.fromMap(reports[index]),
              onTap: () {
                // Acción al hacer clic en la tarjeta, por ejemplo, mostrar más detalles
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetallesSituacionScreen(
                      report: Report.fromMap(reports[index]),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ReportManager {
  final DbHelper dbHelper;

  ReportManager({required this.dbHelper});

  Future<List<Map<String, dynamic>>> getReports() async {
    return await dbHelper.getReports();
  }

  Future<void> deleteReport(int id) async {
    await dbHelper.deleteReport(id);
  }
}
