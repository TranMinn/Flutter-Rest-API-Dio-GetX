class UserModel {
  String? first_name;
  String? last_name;
  String? avatar;
  String? email;
  String? id;

  UserModel(
      {this.first_name, this.last_name, this.avatar, this.email, this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      avatar: json['avatar'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'first_name': first_name,
        'last_name': last_name,
        'avatar': avatar,
        'email': email
      };
}
