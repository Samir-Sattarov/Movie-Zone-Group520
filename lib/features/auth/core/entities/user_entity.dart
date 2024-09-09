import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String surname;
  final String email;
  final String birthDate;

  const UserEntity({
    required this.name,
    required this.surname,
    required this.email,
    required this.birthDate,
  });

  factory UserEntity.empty() {
    return const UserEntity(
      name: '',
      email: '',
      surname: '',
      birthDate: '',
    );
  }

  UserEntity copyWith({
    String? name,
    String? surname,
    String? email,
    String? birthDate,
  }) {
    return UserEntity(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  @override
  List<Object?> get props => [
        name + email,
      ];
}
