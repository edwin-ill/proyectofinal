import 'dart:convert';

import 'package:http/http.dart' as http;

class ObtenerReporte {
  Future<List<Map<String, dynamic>>> obtenerReporte(
      String endpoint, Map<String, String> data) async {
    List<Map<String, dynamic>> reports = [];

    // URL a la que enviar la petición POST
    var url = Uri.parse(endpoint);

    // Datos a enviar en el cuerpo de la petición
    var datos = data;

    // Crear un objeto de tipo `MultipartRequest`
    var request = http.MultipartRequest('POST', url);

    // Agregar los datos al formulario multipart
    request.fields.addAll(datos);

    // Enviar la petición y esperar la respuesta
    var response = await request.send();

    // Leer la respuesta
    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.transform(utf8.decoder).join();
      var decodedResponse = json.decode(jsonResponse);

      // Verificar si la propiedad "datos" está presente
      if (decodedResponse['exito'] == true) {
        var datosResponse = decodedResponse['datos'];
        print('ID: ${datosResponse}');
        // Agrega aquí cualquier otro procesamiento que necesites hacer con los datos
        if (datosResponse is List<dynamic>) {
          reports = datosResponse.map<Map<String, dynamic>>((elemento) {
            if (elemento is Map<String, dynamic>) {
              return elemento;
            } else {
              return {'elemento': elemento};
            }
          }).toList();
        } else {
          print('Los datos recibidos no están en el formato esperado.');
        }
      } else {
        print('La propiedad "datos" está vacía o no contiene datos.');
      }
    } else {
      print('Error: ${response.reasonPhrase}');
    }
    print('ID: ${reports}');

    return reports;
  }
}
