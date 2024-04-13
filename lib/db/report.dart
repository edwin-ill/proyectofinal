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

  Report(
      {required this.id,
      required this.title,
      required this.date,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.state,
      required this.photo,
      required this.feedback});

  factory Report.fromMap(Map<String, dynamic> eventoMap) {
    return Report(
        title: eventoMap['title'],
        description: eventoMap['description'],
        latitude: eventoMap['latitude'],
        longitude: eventoMap['longitude'],
        photo: eventoMap['photo'],
        date: eventoMap['date'],
        feedback: eventoMap['feedback'],
        id: eventoMap['id'],
        state: eventoMap['state']);
  }

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
}
