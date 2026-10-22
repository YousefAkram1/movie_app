// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/networking/base_api.dart' as _i859;
import 'feature/home/data/data_resource/home_remote_data_source.dart' as _i439;
import 'feature/home/data/repo/home_repo_impl.dart' as _i724;
import 'feature/home/domain/repo/home_repo.dart' as _i834;
import 'feature/home/domain/use_cases/get_movie_details.dart' as _i487;
import 'feature/home/domain/use_cases/get_movie_list.dart' as _i844;
import 'feature/home/domain/use_cases/search_movie_use_case.dart' as _i1027;
import 'feature/home/presentation/cubit/details_cubit/movie_details_cubit.dart'
    as _i510;
import 'feature/home/presentation/cubit/home_cubit/movie_list_cubit.dart'
    as _i382;
import 'feature/home/presentation/cubit/search_cubit/movie_search_cubit.dart'
    as _i399;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i859.ApiBase>(() => _i859.ApiBase());
    gh.lazySingleton<_i439.HomeRemoteDataSource>(
      () => _i439.HomeRemoteDataSourceImpl(gh<_i859.ApiBase>()),
    );
    gh.lazySingleton<_i834.HomeRepo>(
      () => _i724.HomeRepoImpl(
        homeRemoteDataSource: gh<_i439.HomeRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i487.GetMovieDetailsUseCase>(
      () => _i487.GetMovieDetailsUseCase(gh<_i834.HomeRepo>()),
    );
    gh.lazySingleton<_i844.GetMovieListUseCase>(
      () => _i844.GetMovieListUseCase(gh<_i834.HomeRepo>()),
    );
    gh.lazySingleton<_i1027.SearchMovieUseCase>(
      () => _i1027.SearchMovieUseCase(gh<_i834.HomeRepo>()),
    );
    gh.factory<_i382.MovieListCubit>(
      () => _i382.MovieListCubit(gh<_i844.GetMovieListUseCase>()),
    );
    gh.factory<_i399.MovieSearchCubit>(
      () => _i399.MovieSearchCubit(gh<_i1027.SearchMovieUseCase>()),
    );
    gh.factory<_i510.MovieDetailsCubit>(
      () => _i510.MovieDetailsCubit(gh<_i487.GetMovieDetailsUseCase>()),
    );
    return this;
  }
}
