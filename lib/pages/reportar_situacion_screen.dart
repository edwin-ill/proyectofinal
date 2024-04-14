import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:proyectofinal/login/post_login/report_situation.dart';
import 'package:proyectofinal/widgets/custom_appbar.dart';
import 'package:proyectofinal/widgets/custom_button.dart';

class ReportarSituacionScreen extends StatefulWidget {
  @override
  ReportarSituacionScreenState createState() => ReportarSituacionScreenState();
}

class ReportarSituacionScreenState extends State<ReportarSituacionScreen> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController ubicacionControllerLat = TextEditingController();
  TextEditingController ubicacionControllerLong = TextEditingController();

  File? image;
  String? image64;

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  }

  String imagenBase64 =
      ''; // Variable para almacenar la imagen en formato base64

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Reportar Situación de Emergencia',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: tituloController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Título del evento o situación',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: descripcionController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Descripción completa',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20.0),
            CustomButton(
              onPressed: () async {
                await getImage();
              },
              text: 'Subir Foto',
              color: Color.fromARGB(255, 0, 76, 152),
              textColor: Color.fromARGB(255, 255, 255, 255),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: ubicacionControllerLat,
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: false, signed: true),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Ubicación geográfica (latitud)',
              ),
            ),
            TextFormField(
              controller: ubicacionControllerLong,
              keyboardType: const TextInputType.numberWithOptions(
                  decimal: false, signed: true),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Ubicación geográfica (longitud)',
              ),
            ),
            SizedBox(height: 20.0),
            CustomButton(
              onPressed: () async {
                // Aquí puedes agregar la lógica para enviar el reporte
                late ReportSituation reportSituation = ReportSituation(
                  id: 0,
                  title: tituloController.text,
                  date: DateTime.now().toString(),
                  description: descripcionController.text,
                  lat: int.parse(ubicacionControllerLat.text),
                  long: int.parse(ubicacionControllerLong.text),
                  photo: image!,
                  feedback: '',
                  state: 0,
                );
                await reportSituation.saveTask();
                Navigator.pushNamed(context, '/inicio');
              },
              text: 'Enviar Reporte',
              color: Color.fromARGB(255, 0, 76, 152),
              textColor: Color.fromARGB(255, 255, 255, 255),
            ),
          ],
        ),
      ),
    );
  }
}
