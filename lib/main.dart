import 'package:flutter/material.dart';
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Defensa Civil App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
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
        '/situaciones': (context) => MapaSituacionesScreen(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú Principal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            MenuOption(
              text: 'Inicio',
              route: '/inicio',
            ),
            MenuOption(
              text: 'Historia',
              route: '/historia',
            ),
            MenuOption(
              text: 'Servicios',
              route: '/servicios',
            ),
            MenuOption(
              text: 'Noticias',
              route: '/noticias',
            ),
            MenuOption(
              text: 'Videos',
              route: '/videos',
            ),
            MenuOption(
              text: 'Albergues',
              route: '/albergues',
            ),
            MenuOption(
              text: 'Mapa de Albergues',
              route: '/mapa_albergues',
            ),
            MenuOption(
              text: 'Medidas Preventivas',
              route: '/medidas_preventivas',
            ),
            MenuOption(
              text: 'Miembros',
              route: '/miembros',
            ),
            MenuOption(
              text: 'Quiero ser Voluntario',
              route: '/voluntario',
            ),
            Divider(),
            MenuOption(
              text: 'Acerca de',
              route: '/acerca_de',
            ),
            MenuOption(
              text: 'Iniciar Sesión',
              route: '/iniciar_sesion',
            ),
            MenuOption(
              text:
                  'Situaciones', // Agregado el nuevo enlace al widget Situaciones
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
