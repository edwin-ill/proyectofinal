import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:proyectofinal/db/dbhelper.dart';
import 'package:proyectofinal/db/report.dart';

class ReportSituation extends StatefulWidget {
  const ReportSituation({super.key});

  @override
  State<ReportSituation> createState() => _ReportSituationState();
}

class _ReportSituationState extends State<ReportSituation> {
  DbHelper dbHelper = DbHelper();

  void showText() {
    setState(() {
      isVisible = true;
      Timer(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            isVisible = false;
          });
        }
      });
    });
  }

  int id = 0;
  String title = 'primera situacion';
  String date = '20240412';
  String description = 'Primera descripcion';
  int lat = 25;
  int long = -70;
  int state = 0;
  String? photo;
  String feedback = 'primer feedbackmm';

  File? _image;
  List reports = [];

  bool isVisible = false;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<String?> convertImageToBase64() async {
    if (_image != null) {
      List<int> imageBytes = await _image!.readAsBytes();
      return base64Encode(imageBytes);
    }
    return null;
  }

  Future<Image?> convertBase64ToImage(String base64String) async {
    try {
      // Decodificar la cadena base64
      Uint8List bytes = base64Decode(base64String.split(',').last);
      return Image.memory(
        bytes,
        width: 50,
        height: 50,
      );
    } catch (e) {
      print('Error al convertir base64 a archivo: $e');
      return null;
    }
  }

  Future<void> saveTask(Report report) async {
    await dbHelper.insertReport(report);
    getTask();
  }

  Future<void> getTask() async {
    final retrievedTask = await dbHelper.getReports();
    setState(() {
      reports = retrievedTask;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? const Padding(
                    padding: EdgeInsets.only(bottom: 18.0),
                    child: Text('Seleccione una imagen'),
                  )
                : Image.file(
                    _image!,
                    width: 100,
                    height: 100,
                  ),
            ElevatedButton(
              onPressed: getImage,
              child: const Text('Seleccionar imagen'),
            ),
            ElevatedButton(
              onPressed: () async {
                String? base64Image = await convertImageToBase64();
                if (base64Image != null) {
                  // Aquí puedes enviar la imagen base64 al servidor
                  saveTask(Report(
                      id: id,
                      title: title,
                      date: date,
                      description: description,
                      latitude: lat,
                      longitude: long,
                      state: state,
                      photo: base64Image,
                      feedback: feedback));
                  showText();
                  setState(() {
                    _image = null;
                  });
                }
              },
              child: const Text('Subir imagen'),
            ),
            Visibility(
                visible: isVisible, child: const Text('Guardado con exito'))
          ],
        ),
      ),
    );
  }
}
