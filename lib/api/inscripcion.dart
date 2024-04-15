import 'dart:convert';

import 'package:http/http.dart' as http;

class Incripcion {
  Future<List> enviarIncripcion(
      String endpoint, Map<String, String> data) async {
    bool userLogged = false;
    String token = '';
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
      var jsonResponse = await response.stream.bytesToString();
      var decodedResponse = json.decode(jsonResponse);

      // Verificar si la propiedad "datos" está presente
      if (decodedResponse['datos'] != null &&
          decodedResponse['datos'].isNotEmpty) {
        var datosResponse = decodedResponse['datos'];
        print('ID: ${datosResponse['id']}');
        print('Nombre: ${datosResponse['nombre']}');
        print('Apellido: ${datosResponse['apellido']}');
        // Agrega aquí cualquier otro procesamiento que necesites hacer con los datos
        userLogged = true;
        token = datosResponse['token'];
        return [userLogged, token];
      } else {
        print('La propiedad "datos" está vacía o no contiene datos.');
      }
    } else {
      print('Error: ${response.reasonPhrase}');
    }

    return [userLogged, token];
  }
}
