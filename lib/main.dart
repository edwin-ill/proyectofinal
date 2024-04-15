import 'package:flutter/material.dart';
import 'package:proyectofinal/login/post_login/my_situations.dart';
import 'package:proyectofinal/pages/reportar_situacion_screen.dart';
import 'pages/inicio.dart';
import 'pages/historia.dart';
import 'pages/servicios.dart';
import 'pages/noticias.dart';
import 'pages/videos.dart';
import 'pages/albergues.dart';
import 'pages/mapa_albergues.dart';
import 'pages/medidas_preventivas.dart';
import 'pages/miembros.dart';
import 'pages/voluntario.dart';
import 'pages/acerca_de.dart';
import 'login/login.dart';
import 'pages/mapa_situaciones.dart';

const MaterialColor miColorPrimario = MaterialColor(0xFFFF6E23, {
  50: Color.fromRGBO(255, 110, 35, 0.1 * 255),
  100: Color.fromRGBO(255, 110, 35, 0.2 * 255),
  200: Color.fromRGBO(255, 110, 35, 0.3 * 255),
  300: Color.fromRGBO(255, 110, 35, 0.4 * 255),
  400: Color.fromRGBO(255, 110, 35, 0.5 * 255),
  500: Color.fromRGBO(255, 110, 35, 0.6 * 255),
  600: Color.fromRGBO(255, 110, 35, 0.7 * 255),
  700: Color.fromRGBO(255, 110, 35, 0.8 * 255),
  800: Color.fromRGBO(255, 110, 35, 0.9 * 255),
  900: Color.fromRGBO(255, 110, 35, 1.0 * 255),
});

UserData userData = UserData();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Defensa Civil App',
      theme: ThemeData(
        primarySwatch: miColorPrimario,
      ),
      initialRoute: '/iniciar_sesion',
      routes: {
        '/inicio': (context) => InicioScreen(),
        '/historia': (context) => HistoriaScreen(),
        '/servicios': (context) => ServiciosScreen(),
        '/noticias': (context) => NoticiasScreen(),
        '/videos': (context) => VideosScreen(),
        '/albergues': (context) => AlberguesScreen(),
        '/mapa_albergues': (context) => MapaAlberguesScreen(),
        '/medidas_preventivas': (context) => MedidasPreventivasScreen(),
        '/miembros': (context) => MiembrosScreen(),
        '/voluntario': (context) => VoluntarioScreen(),
        '/acerca_de': (context) => AcercaDeScreen(),
        '/iniciar_sesion': (context) => IniciarSesionScreen(),
        '/my_situations': (context) => MySituations(token: userData.token),
        '/report_situation': (context) => ReportarSituacionScreen(),
        '/situaciones': (context) =>
            MapaSituacionesScreen(token: userData.token),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  final bool isLogged;
  const MainScreen({super.key, required this.isLogged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 111, 0),
        title: const Text(
          'Menú Principal',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: miColorPrimario,
              ),
              child: Text(
                'Menú Principal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const MenuOption(
              text: 'Inicio',
              route: '/inicio',
            ),
            const MenuOption(
              text: 'Historia',
              route: '/historia',
            ),
            const MenuOption(
              text: 'Servicios',
              route: '/servicios',
            ),
            const MenuOption(
              text: 'Noticias',
              route: '/noticias',
            ),
            const MenuOption(
              text: 'Videos',
              route: '/videos',
            ),
            const MenuOption(
              text: 'Albergues',
              route: '/albergues',
            ),
            const MenuOption(
              text: 'Mapa de Albergues',
              route: '/mapa_albergues',
            ),
            const MenuOption(
              text: 'Medidas Preventivas',
              route: '/medidas_preventivas',
            ),
            const MenuOption(
              text: 'Miembros',
              route: '/miembros',
            ),
            const MenuOption(
              text: 'Quiero ser Voluntario',
              route: '/voluntario',
            ),
            const Divider(),
            const MenuOption(
              text: 'Acerca de',
              route: '/acerca_de',
            ),
            isLogged
                ? const MenuOption(
                    text: 'Mis Situaciones',
                    route: '/my_situations',
                  )
                : const ListTile(title: Text('Campo no disponible')),
            isLogged
                ? const MenuOption(
                    text: 'Reportar Situación',
                    route: '/report_situation',
                  )
                : const ListTile(title: Text('Campo no disponible')),
            MenuOption(
              text: 'Iniciar Sesión',
              route: '/iniciar_sesion',
            ),
            MenuOption(
              text: 'Mapa de Situaciones',
              route: '/situaciones',
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Contenido de la pantalla principal.'),
      ),
    );
  }
}

class MenuOption extends StatelessWidget {
  final String text;
  final String route;

  const MenuOption({
    Key? key,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
