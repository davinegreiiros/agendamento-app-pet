import 'package:equatable/equatable.dart';

enum PetType { dog, cat, bird, fish, other }

enum PetGender { male, female }

class Pet extends Equatable {
  const Pet({
    required this.id,
    required this.name,
    required this.type,
    required this.breed,
    required this.gender,
    required this.birthDate,
    this.imageUrl,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
  });

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

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        breed,
        gender,
        birthDate,
        imageUrl,
        ownerId,
        createdAt,
        updatedAt,
      ];

  Pet copyWith({
    String? id,
    String? name,
    PetType? type,
    String? breed,
    PetGender? gender,
    DateTime? birthDate,
    String? imageUrl,
    String? ownerId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Pet(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      breed: breed ?? this.breed,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      imageUrl: imageUrl ?? this.imageUrl,
      ownerId: ownerId ?? this.ownerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  int get ageInMonths {
    final now = DateTime.now();
    final age = now.difference(birthDate);
    return (age.inDays / 30).round();
  }

  String get ageDescription {
    final months = ageInMonths;
    if (months < 12) {
      return '$months ${months == 1 ? 'mês' : 'meses'}';
    } else {
      final years = (months / 12).floor();
      final remainingMonths = months % 12;
      if (remainingMonths == 0) {
        return '$years ${years == 1 ? 'ano' : 'anos'}';
      } else {
        return '$years ${years == 1 ? 'ano' : 'anos'} e $remainingMonths ${remainingMonths == 1 ? 'mês' : 'meses'}';
      }
    }
  }
}
