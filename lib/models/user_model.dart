class UserModel {
  String id;
  String email;
  String password;
  String name;
  String goal;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.goal,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    goal = json['goal'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'goal': goal,
    };
  }
}
