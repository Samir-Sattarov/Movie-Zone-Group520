import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String surname;
  final String phoneNumber;
  final String birthDate;

  const UserEntity({
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.birthDate,
  });

  factory UserEntity.empty() {
    return const UserEntity(
      name: '',
      phoneNumber: '',
      surname: '',
      birthDate: '',
    );
  }

  UserEntity copyWith({
    String? name,
    String? surname,
    String? phoneNumber,
    String? birthDate,
  }) {
    return UserEntity(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  @override
  List<Object?> get props => [
        name + phoneNumber,
      ];
}
