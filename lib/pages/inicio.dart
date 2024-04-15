import 'package:flutter/material.dart';
import 'package:proyectofinal/login/post_login/my_situations.dart';
import 'package:proyectofinal/pages/noticias_screen.dart';
import 'package:proyectofinal/pages/reportar_situacion_screen.dart';
import 'package:proyectofinal/pages/cambiar_password_screen.dart';
import 'package:proyectofinal/login/login.dart';

UserData userData = UserData();

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inicio'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NoticiasScreens()),
                  );
                },
                child: Text('Ir a Pantalla de Noticias'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReportarSituacionScreen()),
                  );
                },
                child: Text('Ir a Pantalla de Reportar Situación'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MySituations(token: userData.token)),
                  );
                },
                child: Text('Ir a Pantalla de Mis Situaciones'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CambiarPasswordScreen()),
                  );
                },
                child: Text('Ir a Pantalla de Cambiar Contraseña'),
              ),
            ],
          ),
        ));
  }
}
