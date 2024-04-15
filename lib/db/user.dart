//Christopher Yunior Manzueta 2022-0207
class User {
  int id = 0;
  String name;
  String password;

  User({required this.id, required this.name, required this.password});

  factory User.fromMap(Map<String, dynamic> eventoMap) {
    return User(
        id: eventoMap['id'],
        name: eventoMap['name'],
        password: eventoMap['password']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
    };
  }
}
