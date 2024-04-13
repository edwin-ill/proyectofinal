import 'package:flutter/material.dart';
import 'package:proyectofinal/widgets/custom_appbar.dart';
import 'package:proyectofinal/widgets/custom_button.dart';
class CambiarPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Cambiar Contraseña',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
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
             onPressed: () {
                //Aquí puedes agregar la lógica 

              },
              text: 'Cambiar Contraseña',
              color:Color.fromARGB(255, 0, 76, 152) ,
               textColor: Color.fromARGB(255, 255, 255, 255),
            ),
          ],
        ),
      ),
    );
  }
}
