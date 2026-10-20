import 'package:get_it/get_it.dart';

import 'core/networking/base_api.dart';
import 'feature/home/data/data_resource/home_remote_data_source.dart';
import 'feature/home/data/repo/home_repo_impl.dart';
import 'feature/home/domain/repo/home_repo.dart';
import 'feature/home/domain/use_cases/get_movie_details.dart';
import 'feature/home/domain/use_cases/get_movie_list.dart';
import 'feature/home/domain/use_cases/search_movie_use_case.dart';
import 'feature/home/presentation/cubit/details_cubit/movie_details_cubit.dart';
import 'feature/home/presentation/cubit/home_cubit/movie_list_cubit.dart';
import 'feature/home/presentation/cubit/search_cubit/movie_search_cubit.dart';

final GetIt s1 = GetIt.instance;

Future<void> init() async {
  s1.registerLazySingleton(() => ApiBase());

  s1.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(s1()),
  );

  s1.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: s1()),
  );
  s1.registerLazySingleton(() => GetMovieDetailsUseCase(s1()));
  s1.registerLazySingleton(() => GetMovieListUseCase(s1()));
  s1.registerLazySingleton(() => SearchMovieUseCase(s1()));
  s1.registerFactory(() => MovieDetailsCubit(s1()));
  s1.registerFactory(() => MovieListCubit(s1()));
  s1.registerFactory(() => MovieSearchCubit(s1()));
}
