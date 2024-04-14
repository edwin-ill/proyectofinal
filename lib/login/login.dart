import 'package:flutter/material.dart';
import 'package:proyectofinal/db/dbhelper.dart';
import 'package:proyectofinal/db/user.dart';
import 'package:proyectofinal/main.dart';
import 'package:proyectofinal/widgets/custom_button.dart';
import 'package:proyectofinal/widgets/custom_appbar.dart';

class IniciarSesionScreen extends StatefulWidget {
  IniciarSesionScreen({super.key});

  @override
  State<IniciarSesionScreen> createState() => _IniciarSesionScreenState();
}

class _IniciarSesionScreenState extends State<IniciarSesionScreen> {
  final DbHelper db = DbHelper();
  TextEditingController name = TextEditingController();
  TextEditingController contr = TextEditingController();

  bool isLogged = false;
  String text = 'Log in';

  Future<void> verificar(String name, String pass) async {
    List returnedUser =
        await db.getUser(User(id: 0, name: name, password: pass));
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
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Nombre de Usuario',
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
              onPressed: () async{
                if(name.text != '' && contr.text != ''){
                await verificar(name.text, contr.text);
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
                      builder: (context) => const MainScreen(
                        isLogged: false,
                      ),
                    ));
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
}
