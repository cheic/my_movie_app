import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:my_movie_app/data/core/api_client.dart';
import 'package:my_movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:my_movie_app/data/repositories/movie_repository_impl.dart';
import 'package:my_movie_app/domain/repositories/movie_repository.dart';
import 'package:my_movie_app/domain/usecases/get_coming_soon.dart';
import 'package:my_movie_app/domain/usecases/get_playing_now.dart';
import 'package:my_movie_app/domain/usecases/get_popular.dart';
import 'package:my_movie_app/domain/usecases/get_trending.dart';
import 'package:my_movie_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

final getInstance = GetIt.I;

Future init() async {
  getInstance.registerLazySingleton<Client>(() => Client());
  getInstance.registerLazySingleton<ApiClient>(() => ApiClient(getInstance()));
  getInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getInstance()));
  getInstance.registerLazySingleton<GetTrending>(() => GetTrending(getInstance()));
  getInstance.registerLazySingleton<GetPopular>(() => GetPopular(getInstance()));
  getInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getInstance()));
  getInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getInstance()));
  getInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getInstance()));

  getInstance.registerFactory(() => MovieCarouselBloc(getTrending: getInstance(),));
}