import 'package:flutter/material.dart';
import 'package:proyectofinal/widgets/custom_appbar.dart';
import 'package:proyectofinal/widgets/custom_button.dart';

class ReportarSituacionScreen extends StatefulWidget {
  @override
  _ReportarSituacionScreenState createState() => _ReportarSituacionScreenState();
}

class _ReportarSituacionScreenState extends State<ReportarSituacionScreen> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController ubicacionController = TextEditingController();

  String imagenBase64 = ''; // Variable para almacenar la imagen en formato base64

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
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
             onPressed: () {
                //Aquí puedes agregar la lógica para subir una foto y convertirla a base64

              },
              text: 'Subir Foto',
              color:Color.fromARGB(255, 0, 76, 152),
              textColor: Color.fromARGB(255, 255, 255, 255),
            
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: ubicacionController,
              decoration: InputDecoration(
                      filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
                labelText: 'Ubicación geográfica (latitud, longitud)',
              ),
            ),
            SizedBox(height: 20.0),
            CustomButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para enviar el reporte
               /* String titulo = tituloController.text;
                String descripcion = descripcionController.text;
                String ubicacion = ubicacionController.text;*/
                
           
              },
              text: 'Enviar Reporte',
              color:Color.fromARGB(255, 0, 76, 152),
              textColor: Color.fromARGB(255, 255, 255, 255),
            ),
          ],
        ),
      ),
    );
  }
}
