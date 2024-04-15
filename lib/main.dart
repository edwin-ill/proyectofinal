import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal/login/post_login/my_situations.dart';
import 'package:proyectofinal/pages/cambiar_password_screen.dart';
import 'package:proyectofinal/pages/noticias_screen.dart';
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
        '/noticias_especificas': (context) => NoticiasScreens(),
        '/my_situations': (context) => MySituations(),
        '/report_situation': (context) => ReportarSituacionScreen(),
        '/change_password': (context) => CambiarPasswordScreen(),
        '/situaciones': (context) => MapaSituacionesScreen(),
        '/login': (context) => IniciarSesionScreen(),
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
          'Inicio',
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
                'Inicio',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
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
            isLogged
                ? const MenuOption(
                    text: 'Cerrar seccion',
                    route: '/login',
                  )
                : const MenuOption(
                    text: 'Iniciar seccion',
                    route: '/login',
                  ),
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
            isLogged
                ? const MenuOption(
                    text: 'Cambiar password',
                    route: '/change_password',
                  )
                : const ListTile(title: Text('Campo no disponible')),
            isLogged
                ? const MenuOption(
                    text: 'Noticias especificas',
                    route: '/noticias_especificas',
                  )
                : const ListTile(title: Text('Campo no disponible')),
            MenuOption(
              text:
                  'Mapa de Situaciones', // Agregado el nuevo enlace al widget Situaciones
              route: '/situaciones',
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // Título del CarouselSlider
            Container(
              padding: EdgeInsets.only(
                  top: 40.0, bottom: 40.0, left: 10), // Margen vertical de 20.0
              child: Text(
                'Acciones importantes de la Defensa Civil:',
                style: TextStyle(
                  color: Color(0xFF004C98),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // CarouselSlider con los Card
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [
                // Slider 1
                Card(
                  color: Color(0xFF004C98),
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://presidencia.gob.do/sites/default/files/styles/large/public/news/2022-10/310690518_170442345577808_2718689553182378246_n%20%281%29.jpg?itok=4ZF7puvW',
                          height: 200,
                          width: 400,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Defensa Civil apuesta al uso de la tecnología para ser más eficiente ante cualquier fenomeno',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Slider 2
                Card(
                  color: Color(0xFF004C98),
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://aplatanaonews.com/wp-content/uploads/2023/11/FOTO-2-631x560.jpg',
                          height: 200,
                          width: 400,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Defensa Civil rescata siete personas con vida tras crecida del Río Fula, Monseñor Nouel',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Slider 3
                Card(
                  color: Color(0xFF004C98),
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://i0.wp.com/nuevodiario-assets.s3.us-east-2.amazonaws.com/wp-content/uploads/2023/11/19173248/WhatsApp-Image-2023-11-19-at-9.20.31-PM-1.jpeg?resize=640%2C480&quality=100&ssl=1',
                          height: 200,
                          width: 400,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Defensa Civil rescata una familia estaba atrapada por crecida de río Duey en Higüey',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
