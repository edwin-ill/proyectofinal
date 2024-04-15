//Christopher Yunior Manzueta 2022-0207
class Report {
  int id = 0;
  String title;
  String date;
  String description;
  int latitude;
  int longitude;
  int state;
  String photo;
  String feedback;
  String token;
  String contr;

  Report(
      {required this.id,
      required this.title,
      required this.date,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.state,
      required this.photo,
      required this.feedback,
      required this.token,
      required this.contr});

  factory Report.fromMap(Map<String, dynamic> eventoMap) {
    return Report(
        title: eventoMap['titulo'],
        description: eventoMap['descripcion'],
        latitude: eventoMap['latitud'],
        longitude: eventoMap['longitud'],
        photo: eventoMap['foto'],
        date: eventoMap['fecha'],
        feedback: '',
        id: eventoMap['id'],
        state: eventoMap['estado'],
        token: '',
        contr: '');
  }

//! quien use to map estar atento
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'photo': photo,
      'date': date,
      'feedback': feedback,
      'state': state,
    };
  }

  Map<String, String> toMapForApi() {
    return {
      'titulo': title,
      'descripcion': description,
      'latitud': latitude.toString(),
      'longitud': longitude.toString(),
      'foto': photo,
      'clave': contr,
      'token': token
    };
  }
}
