class User {
  int id;
  String name;
  String email;
  String username;
  String phone;

  User(int id, String name, String email, String username, String phone) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.username = username;
    this.phone = phone;
  }

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        username = json['username'],
        phone = json['phone'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'phone': phone
    };
  }
}
