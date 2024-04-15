import 'package:flutter/material.dart';
import 'package:proyectofinal/api/inscripcion.dart';
import 'package:proyectofinal/main.dart';
import 'package:proyectofinal/widgets/custom_button.dart';
import 'package:proyectofinal/widgets/custom_appbar.dart';

class UserData {
  String token = '';
}

class IniciarSesionScreen extends StatefulWidget {
  const IniciarSesionScreen({Key? key});

  @override
  State<IniciarSesionScreen> createState() => _IniciarSesionScreenState();
}

class _IniciarSesionScreenState extends State<IniciarSesionScreen> {
  TextEditingController cedula = TextEditingController();
  TextEditingController contr = TextEditingController();

  String text = 'Log in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: cedula,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Cedula de Usuario',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: contr,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Contraseña',
              ),
            ),
            SizedBox(height: 20.0),
            CustomButton(
              onPressed: () async {
                if (cedula.text != '' && contr.text != '') {
                  await verificar(cedula.text, contr.text);
                }
              },
              text: 'Iniciar Sesión',
              color: Color.fromARGB(255, 0, 76, 152),
              textColor: Colors.white,
            ),
            SizedBox(height: 20.0),
            CustomButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(isLogged: false),
                  ),
                );
              },
              text: 'Iniciar como invitado',
              color: Color.fromARGB(255, 0, 76, 152),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 111, 0),
    );
  }

  Future<void> verificar(String cedula, String pass) async {
    Incripcion inc = Incripcion();
    List user = await inc.enviarIncripcion(
        'https://adamix.net/defensa_civil/def/iniciar_sesion.php',
        {'clave': pass, 'cedula': cedula});
    bool userLogged = user[0];
    String token = user[1];

    if (userLogged) {
      UserData userData = UserData();
      userData.token = token;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(isLogged: true),
        ),
      );
    } else {
      setState(() {
        text = 'Credenciales incorrectas';
      });
    }
  }
}
