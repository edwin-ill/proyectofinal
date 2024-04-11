import 'package:flutter/material.dart';
import 'inicio.dart';
import 'historia.dart';
import 'servicios.dart';
import 'noticias.dart';
import 'videos.dart';
import 'albergues.dart';
import 'mapa_albergues.dart';
import 'medidas_preventivas.dart';
import 'miembros.dart';
import 'voluntario.dart';
import 'acerca_de.dart';
import 'iniciar_sesion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
    super.key,
    required this.text,
    required this.route,
  });

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
