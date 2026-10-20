import '../../../../core/networking/api_constaints.dart';
import '../../../../core/networking/base_api.dart';
import '../models/movie_model/result.dart';

abstract class HomeRemoteDataSource {
  Future<List<Result>> getMovieListData();
  Future<List<Result>> searchMovieData({required String query});
  Future<Result> getMovieDetailsData({required int id});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiBase apiBase;
  HomeRemoteDataSourceImpl(this.apiBase);
  @override
  Future<Result> getMovieDetailsData({required int id}) async {
    final data = await apiBase.get(path: ApiConstaints.getMoviePathById(id));
    final Result movie = Result.fromJson(data);
    return movie;
  }

  @override
  Future<List<Result>> getMovieListData() async {
    final data = await apiBase.get(path: ApiConstaints.allMoviesPath);
    final List<Result> movies = [];
    for (var result in data['results']) {
      movies.add(Result.fromJson(result));
    }
    return movies;
  }

  @override
  Future<List<Result>> searchMovieData({required String query}) async {
    final data = await apiBase.get(
      path: ApiConstaints.searchMoviePath,
      queryParameters: queryParameters(query: query),
    );
    final List<Result> movies = [];
    for (var result in data['results']) {
      movies.add(Result.fromJson(result));
    }
    return movies;
  }
}

Map<String, dynamic> queryParameters({required String query}) => {
  'query': query,
  'language': 'en-US',
  'page': 1,
};
