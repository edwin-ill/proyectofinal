import 'package:flutter/material.dart';
//import 'package:proyectofinal/pages/detalles_situacion_screen.dart';
import 'package:proyectofinal/pages/mis_situaciones_screen.dart';

/*class SituacionCard extends StatelessWidget {
  final Situacion situacion;

  SituacionCard({required this.situacion});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(situacion.titulo),
        subtitle: Text(situacion.fecha),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetallesSituacionScreen(situacion: situacion),
            ),
          );
        },
      ),
    );
  }
}*/

class SituacionCard extends StatelessWidget {
  final Situacion situacion;
  final Function() onTap;

  const SituacionCard({
    Key? key,
    required this.situacion,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4.0)),
              // child: Image.network(
              //   situacion.foto, // URL de la imagen
              //   fit: BoxFit.cover,
              //   height: 150, // Altura de la imagen
              // ),
            ),
            ListTile(
              title: Text(situacion.titulo),
              subtitle: Text(situacion.fecha +' | '+ situacion.estado),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
