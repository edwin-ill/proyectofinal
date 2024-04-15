import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
