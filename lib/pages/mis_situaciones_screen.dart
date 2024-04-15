//! intercambiar con mi clase parecida a esta

// import 'package:flutter/material.dart';
// //import 'package:proyectofinal/widgets/custom_appbar.dart';
// import 'package:proyectofinal/pages/detalles_situacion_screen.dart';
// import 'package:proyectofinal/widgets/situacion_card.dart';

// class MisSituacionesScreen extends StatelessWidget {
//   final List<Situacion> situaciones = [
//     Situacion(
//       codigo: '001',
//       fecha: '12/04/2024',
//       titulo: 'Incendio en la calle principal',
//       descripcion: 'Incendio reportado en la calle principal del pueblo.',
//       foto:
//           'https://upload.wikimedia.org/wikipedia/commons/d/d7/Bandera_de_la_Defensa_Civil_Republica_Dominicana.svg',
//       estado: 'En proceso',
//       comentarios: 'Enviando equipo de bomberos.',
//     ),
//     Situacion(
//       codigo: '002',
//       fecha: '13/04/2024',
//       titulo: 'Fuga de gas en la escuela',
//       descripcion: 'Fuga de gas detectada en la escuela local.',
//       foto:
//           'https://upload.wikimedia.org/wikipedia/commons/d/d7/Bandera_de_la_Defensa_Civil_Republica_Dominicana.svg',
//       estado: 'Resuelto',
//       comentarios: 'Fuga de gas reparada con éxito.',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mis Situaciones'),
//       ),
//       body: ListView.builder(
//         itemCount: situaciones.length,
//         itemBuilder: (context, index) {
//           return SituacionCard(
//             report: situaciones[index],
//             onTap: () {
//               // Acción al hacer clic en la tarjeta, por ejemplo, mostrar más detalles
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetallesSituacionScreen(
//                     report: situaciones[index],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
