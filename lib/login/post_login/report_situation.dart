import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:proyectofinal/db/dbhelper.dart';
import 'package:proyectofinal/db/report.dart';

class ReportSituation {
  final int id;
  final String title;
  final String date;
  final String description;
  final File photo;
  final int lat;
  final int long;
  final int state;
  final String feedback;

  ReportSituation(
      {required this.id,
      required this.title,
      required this.date,
      required this.description,
      required this.photo,
      required this.lat,
      required this.long,
      required this.state,
      required this.feedback});

  DbHelper dbHelper = DbHelper();

  // void showText() {

  Future<String?> convertImageToBase64() async {
    List<int> imageBytes = await photo.readAsBytes();
    return base64Encode(imageBytes);
  }

  // Future<Image?> convertBase64ToImage(String base64String) async {
  //   try {
  //     // Decodificar la cadena base64
  //     Uint8List bytes = base64Decode(base64String.split(',').last);
  //     return Image.memory(
  //       bytes,
  //       width: 50,
  //       height: 50,
  //     );
  //   } catch (e) {
  //     print('Error al convertir base64 a archivo: $e');
  //     return null;
  //   }
  // }

  Future<void> saveTask() async {
    String? image64 = await convertImageToBase64();
    await dbHelper.insertReport(Report(
        id: id,
        title: title,
        date: date,
        description: description,
        feedback: feedback,
        latitude: lat,
        longitude: long,
        state: state,
        photo: image64!));
  }
}

// class ReportSituation extends StatefulWidget {
//   final int id;
//   final String title;
//   final String date;
//   final String description;
//   final int lat;
//   final int long;
//   final int state;
//   final String feedback;

//   const ReportSituation({super.key, 
//   required this.id, 
//   required this.title, 
//   required this.date, 
//   required this.description,
//   required this.lat,
//   required this.long,
//   required this.state,
//   required this.feedback});

//   @override
//   State<ReportSituation> createState() => _ReportSituationState();
// }

// class _ReportSituationState extends State<ReportSituation> {
//   DbHelper dbHelper = DbHelper();

  // void showText() {
  //   setState(() {
  //     isVisible = true;
  //     Timer(const Duration(seconds: 2), () {
  //       if (mounted) {
  //         setState(() {
  //           isVisible = false;
  //         });
  //       }
  //     });
  //   });
  // }

  // int id = 0;
  // String title = 'primera situacion';
  // String date = '20240412';
  // String description = 'Primera descripcion';
  // int lat = 25;
  // int long = -70;
  // int state = 0;
  // String? photo;
  // String feedback = 'primer feedbackmm';

  // late int id = widget.id;
  // late String title = widget.title;
  // late String date = widget.date;
  // late String description = widget.description;
  // late int lat = widget.lat;
  // late int long = widget.long;
  // late int state = widget.state;
  // late String? photo;
  // late String feedback = widget.feedback;


//   File? _image;
//   List reports = [];

//   bool isVisible = false;

//   Future<void> getImage() async {
//     final ImagePicker picker = ImagePicker();
//     XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
      // setState(() {
      //   _image = File(pickedImage.path);
      // });
//     }
//   }

//   Future<String?> convertImageToBase64() async {
//     if (_image != null) {
//       List<int> imageBytes = await _image!.readAsBytes();
//       return base64Encode(imageBytes);
//     }
//     return null;
//   }

//   Future<Image?> convertBase64ToImage(String base64String) async {
//     try {
      // Decodificar la cadena base64
//       Uint8List bytes = base64Decode(base64String.split(',').last);
//       return Image.memory(
//         bytes,
//         width: 50,
//         height: 50,
//       );
//     } catch (e) {
//       print('Error al convertir base64 a archivo: $e');
//       return null;
//     }
//   }

//   Future<void> saveTask(Report report) async {
//     await dbHelper.insertReport(report);
//     getTask();
//   }

//   Future<void> getTask() async {
//     final retrievedTask = await dbHelper.getReports();
    // setState(() {
    //   reports = retrievedTask;
    // });
//   }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Image Upload'),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           _image == null
  //               ? const Padding(
  //                   padding: EdgeInsets.only(bottom: 18.0),
  //                   child: Text('Seleccione una imagen'),
  //                 )
  //               : Image.file(
  //                   _image!,
  //                   width: 100,
  //                   height: 100,
  //                 ),
  //           ElevatedButton(
  //             onPressed: getImage,
  //             child: const Text('Seleccionar imagen'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () async {
  //               String? base64Image = await convertImageToBase64();
  //               if (base64Image != null) {
  //                 // Aquí puedes enviar la imagen base64 al servidor
  //                 saveTask(Report(
  //                     id: id,
  //                     title: title,
  //                     date: date,
  //                     description: description,
  //                     latitude: lat,
  //                     longitude: long,
  //                     state: state,
  //                     photo: base64Image,
  //                     feedback: feedback));
  //                 setState(() {
  //                   _image = null;
  //                 });
  //               }
  //             },
  //             child: const Text('Subir imagen'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
// }

