import 'package:flutter/material.dart';
import 'package:proyectofinal/db/dbhelper.dart';
import 'package:proyectofinal/widgets/custom_appbar.dart';
import 'package:proyectofinal/widgets/custom_button.dart';

class CambiarPasswordScreen extends StatelessWidget {
  final DbHelper db = DbHelper();

  final TextEditingController newContr = TextEditingController();
  final TextEditingController newContr2 = TextEditingController();
    final TextEditingController actualContr = TextEditingController();


  CambiarPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Cambiar Contraseña',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: actualContr,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Contraseña Actual',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: newContr,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Nueva Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: newContr2,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Confirmar Nueva Contraseña',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            CustomButton(
              onPressed: () async{
                if (newContr.text == newContr2.text) {
                  await db.updateUserPassword(actualContr.text ,newContr.text);
                }
              },
              text: 'Cambiar Contraseña',
              color: Color.fromARGB(255, 0, 76, 152),
              textColor: Color.fromARGB(255, 255, 255, 255),
            ),
          ],
        ),
      ),
    );
  }
}
