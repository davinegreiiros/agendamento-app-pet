import 'package:agendamento_pet_app/features/pets/domain/entities/pet.dart';

class PetModel {
  const PetModel({
    required this.id,
    required this.name,
    required this.type,
    required this.breed,
    required this.gender,
    required this.birthDate,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
    this.imageUrl,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        id: json['id'] as String,
        name: json['name'] as String,
        type: _petTypeFromString(json['type'] as String),
        breed: json['breed'] as String,
        gender: _petGenderFromString(json['gender'] as String),
        birthDate: DateTime.parse(json['birthDate'] as String),
        imageUrl: json['imageUrl'] as String?,
        ownerId: json['ownerId'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
      );

  factory PetModel.fromEntity(Pet pet) => PetModel(
        id: pet.id,
        name: pet.name,
        type: pet.type,
        breed: pet.breed,
        gender: pet.gender,
        birthDate: pet.birthDate,
        imageUrl: pet.imageUrl,
        ownerId: pet.ownerId,
        createdAt: pet.createdAt,
        updatedAt: pet.updatedAt,
      );

  final String id;
  final String name;
  final PetType type;
  final String breed;
  final PetGender gender;
  final DateTime birthDate;
  final String? imageUrl;
  final String ownerId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Pet toEntity() => Pet(
        id: id,
        name: name,
        type: type,
        breed: breed,
        gender: gender,
        birthDate: birthDate,
        imageUrl: imageUrl,
        ownerId: ownerId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': _petTypeToString(type),
        'breed': breed,
        'gender': _petGenderToString(gender),
        'birthDate': birthDate.toIso8601String(),
        'imageUrl': imageUrl,
        'ownerId': ownerId,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  static PetType _petTypeFromString(String type) {
    switch (type.toLowerCase()) {
      case 'dog':
        return PetType.dog;
      case 'cat':
        return PetType.cat;
      case 'bird':
        return PetType.bird;
      case 'fish':
        return PetType.fish;
      default:
        return PetType.other;
    }
  }

  static String _petTypeToString(PetType type) {
    switch (type) {
      case PetType.dog:
        return 'dog';
      case PetType.cat:
        return 'cat';
      case PetType.bird:
        return 'bird';
      case PetType.fish:
        return 'fish';
      case PetType.other:
        return 'other';
    }
  }

  static PetGender _petGenderFromString(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return PetGender.male;
      case 'female':
        return PetGender.female;
      default:
        return PetGender.male;
    }
  }

  static String _petGenderToString(PetGender gender) {
    switch (gender) {
      case PetGender.male:
        return 'male';
      case PetGender.female:
        return 'female';
    }
  }
}
