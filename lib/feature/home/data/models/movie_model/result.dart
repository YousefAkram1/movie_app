class Result {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final DateTime? releaseDate;

  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final String? originalLanguage;
  final String? originalTitle;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const Result({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String? ?? '',
      releaseDate: parseReleaseDate(json['release_date']),
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'release_date': releaseDate?.toIso8601String().split('T').first,
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}

DateTime? parseReleaseDate(dynamic value) {
  if (value == null || value.toString().trim().isEmpty) {
    return null;
  }

  return DateTime.tryParse(value.toString());
}
