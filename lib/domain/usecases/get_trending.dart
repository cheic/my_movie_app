import 'package:dartz/dartz.dart';
import 'package:my_movie_app/domain/entities/app_error.dart';
import 'package:my_movie_app/domain/entities/movie_entity.dart';
import 'package:my_movie_app/domain/entities/no_params.dart';
import 'package:my_movie_app/domain/repositories/movie_repository.dart';
import 'package:my_movie_app/domain/usecases/usecase.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams>{
  final MovieRepository movieRepository;

  GetTrending(this.movieRepository);

  @override
  Future<Either<AppError,List<MovieEntity>>> call(NoParams ) async{
  return await movieRepository.getTrending();
  }
}