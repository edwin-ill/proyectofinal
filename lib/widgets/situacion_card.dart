import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyectofinal/db/report.dart';

class SituacionCard extends StatelessWidget {
  final Report report;
  final Function() onTap;

  const SituacionCard({
    super.key,
    required this.report,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
              child: Image.memory(
                base64Decode(report.photo.toString()),
                width: 400,
                height: 350,
              ),
            ),
            ListTile(
              title: Text(report.title),
              subtitle: Text('${report.date} | ${report.state == 1 ? 'Resuelto': 'En proceso'}'),
              trailing: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
