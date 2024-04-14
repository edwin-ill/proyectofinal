import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyectofinal/db/dbhelper.dart';

class MySituations extends StatefulWidget {
  const MySituations({super.key});

  @override
  State<MySituations> createState() => _MySituationsState();
}

class _MySituationsState extends State<MySituations> {
  ReportManager reportManager = ReportManager(dbHelper: DbHelper());
  List<Map> reports = [];
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
        return Card(
            child: InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              Image.memory(
                                base64Decode(
                                    reports[index]['photo'].toString()),
                                width: 400,
                                height: 350,
                              ),
                              const SizedBox(height: 16.0),
                              Text(reports[index]['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(reports[index]['date']),
                              const SizedBox(height: 10.0),
                              Text(reports[index]['description']),
                              Text(
                                  "Latitude: ${reports[index]['latitude']}, Longitude: ${reports[index]['longitude']}"),
                              Text("State: ${reports[index]['state']}"),
                              const SizedBox(height: 10.0),
                              Text("Feedback: ${reports[index]['feedback']}"),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cerrar'),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: MemoryImage(
                  base64Decode(reports[index]['photo'].toString())),
            ),
            title: Text(reports[index]['title']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(reports[index]['date']),
                Text(reports[index]['description']),
                Text(
                    "Latitude: ${reports[index]['latitude']}, Longitude: ${reports[index]['longitude']}"),
                Text("State: ${reports[index]['state']}"),
                Text("Feedback: ${reports[index]['feedback']}"),
                ElevatedButton(
                    onPressed: () => deleteReport(reports[index]['id']),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
        ));
                  },
                ),
      ),
    );
  }
}

class ReportManager {
  final DbHelper dbHelper;

  ReportManager({required this.dbHelper});

  Future<List<Map>> getReports() async {
    return await dbHelper.getReports();
  }

  Future<void> deleteReport(int id) async {
    await dbHelper.deleteReport(id);
  }
}
