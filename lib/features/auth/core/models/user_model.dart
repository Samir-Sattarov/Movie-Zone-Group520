// ignore_for_file: unused_import


import '../entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required name,
    required surname,
    required phoneNumber,
    required birthDate,
  }) : super(
          name: name,
          surname: surname,
          phoneNumber: phoneNumber,
          birthDate: birthDate,
        );

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
      surname: entity.surname,
      phoneNumber: entity.phoneNumber,
      birthDate: entity.birthDate,
    );
  }

  factory UserModel.fromJson(
      Map<String, dynamic> json, List<dynamic> addresses) {
    return UserModel(
      name: json['first_name'] ?? "",
      surname: json['last_name'] ?? "",
      phoneNumber: json['phone_number'] ?? "",
      birthDate: "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user": {
        'first_name': name,
        'last_name': surname,
      }
    };
  }
}
