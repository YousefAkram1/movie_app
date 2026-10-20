import 'package:movie_app/feature/home/data/models/movie_model/result.dart';
import 'package:movie_app/feature/home/domain/entities/movie_home_details_entity.dart';

class MovieMapper {
  static MovieEntity toEntity(Result model) {
    return MovieEntity(
      id: model.id,
      title: model.title,
      description: model.overview,
      image: model.posterPath,
      category: model.originalLanguage!,
      releaseDate: model.releaseDate,
    );
  }
}
