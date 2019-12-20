// user data model
class User {
  int id;
  String name;
  String email;
  DateTime lastAccessed;

  User({this.id, this.name, this.email, this.lastAccessed});

  User.initial()
      : id = 0,
        name = '',
        email = '',
        lastAccessed = null;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    lastAccessed = DateTime.fromMillisecondsSinceEpoch(json['lastAccessed']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['lastAccessed'] = lastAccessed.millisecondsSinceEpoch;
    return data;
  }
}