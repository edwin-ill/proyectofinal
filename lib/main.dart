import 'package:flutter/material.dart';
import 'package:proyectofinal/login/post_login/my_situations.dart';
import 'package:proyectofinal/login/post_login/report_situation.dart';
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
        '/my_situations': (context) => MySituations(),
        '/report_situation': (context) => ReportSituation()
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
        title: const Text('Menú Principal'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
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
