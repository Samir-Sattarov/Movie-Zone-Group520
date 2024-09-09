// ignore_for_file: unused_import


import '../entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required name,
    required surname,
    required email,
    required birthDate,
  }) : super(
          name: name,
          surname: surname,
          email: email,
          birthDate: birthDate,
        );

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
      surname: entity.surname,
      email: entity.email,
      birthDate: entity.birthDate,
    );
  }

  factory UserModel.fromJson(
      Map<String, dynamic> json, List<dynamic> addresses) {
    return UserModel(
      name: json['first_name'] ?? "",
      surname: json['last_name'] ?? "",
      email: json['email'] ?? "",
      birthDate: "",
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
