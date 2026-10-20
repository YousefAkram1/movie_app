import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String image;
  final String title;
  final String category;
  final String description;
  final int id;
  final DateTime? releaseDate;

  const MovieEntity({
    required this.image,
    required this.title,
    required this.category,
    required this.description,
    required this.id,
    this.releaseDate,
  });

  @override
  List<Object?> get props => [
    image,
    title,
    category,
    description,
    id,
    releaseDate,
  ];
}
