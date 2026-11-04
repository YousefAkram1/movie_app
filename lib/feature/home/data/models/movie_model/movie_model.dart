import 'result.dart';

class MovieModel {
  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

  const MovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map(
            (e) => Result.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results?.map((e) => e.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}