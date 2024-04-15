import 'package:flutter/material.dart';

class HistoriaScreen extends StatelessWidget {
  const HistoriaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historia',style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 255, 111, 0)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Historia de la Defensa Civil',
                
                style: TextStyle(fontSize: 24, color: Color(0xFF004C98),fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Image.network(
                'https://defensacivil.gob.do/images/slide/2021/logoNuevoDefensa.png',
                height: 200,
              ),
               SizedBox(height: 40),
              Text(
                'Antes del año 1966, cuando llegaba la temporada de huracanes, un grupo de radioaficionados se reunía en la Cruz Roja para estar atentos por si surgía algún tipo de emergencia, inmediatamente ponerse a disposición y ayudar en todo lo posible, inclusive, usando sus propios equipos de comunicación para así tener contacto con el exterior en caso de que las redes telefónicas resultaran afectadas.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 40),
              Image.network(
                'https://pbs.twimg.com/media/E4FnOY5WYAg6Ng4?format=jpg&name=large',
                height: 200,
              ),
              SizedBox(height: 40),
              Text(
                'Al surgir el triunvirato fue designado el Dr. Rafael Cantizano Arias, como presidente de la Cruz Roja y al mismo tiempo nombraron al Ing. Carlos D´ Franco como director de la Defensa Civil, quien con un grupo compuesto por seis personas, se instaló en la calle Francia esquina Galván, siendo esa la primera oficina de la Defensa Civil.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 40),
              Text(
                'Al surgir el Gobierno Provisional, presidido por el Dr. Héctor García Godoy, a los diecisiete días del mes de junio de 1966, fue promulgada la Ley 257, mediante la cual fue creada la Defensa Civil, institución dependiente de la Secretaría Administrativa de la Presidencia (ahora Ministerio de la Presidencia) y quien en la actualidad preside la Comisión Nacional de Emergencias.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 40), // SizedBox para agregar espacio vertical de 20 píxeles
              Text(
                'Más adelante, el local fue trasladado a la calle Dr. Delgado No. 164 y luego en la gestión del Contralmirante Radhamés Lora Salcedo se reubicó a la Plaza de la Salud, donde aún permanece.',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
