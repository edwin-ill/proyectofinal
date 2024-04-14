import 'package:flutter/material.dart';
import 'package:proyectofinal/db/dbhelper.dart';
import 'package:proyectofinal/db/user.dart';
import 'package:proyectofinal/main.dart';

class IniciarSesionScreen extends StatefulWidget {
  IniciarSesionScreen({super.key});

  @override
  State<IniciarSesionScreen> createState() => _IniciarSesionScreenState();
}

class _IniciarSesionScreenState extends State<IniciarSesionScreen> {
  final DbHelper db = DbHelper();
  bool isLogged = false;
  String text = 'Log in';

  Future<void> verificar() async {
    List returnedUser =
        await db.getUser(User(id: 0, name: 'JUAN', password: '123'));
    setState(() {
      if (returnedUser.isNotEmpty) {
        isLogged = true;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(
                isLogged: isLogged,
              ),
            ));
      } else {
        isLogged = false;
        text = 'Credenciales incorrectas';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesion'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(text),
            ElevatedButton(onPressed: () => verificar(), child: Text('enviar')),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(
                        isLogged: isLogged,
                      ),
                    )),
                child: const Text('Entrar como invitado'))
          ],
        ),
      ),
    );
  }
}
