import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:my_movie_app/data/core/api_client.dart';
import 'package:my_movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:my_movie_app/data/repositories/movie_repository_impl.dart';
import 'package:my_movie_app/domain/repositories/movie_repository.dart';
import 'package:my_movie_app/domain/usecases/get_trending.dart';
import 'package:my_movie_app/presentation/movie_app.dart';

import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/entities/no_params.dart';
import 'package:pedantic/pedantic.dart';
import 'di/get_it.dart' as getIt;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  );
  unawaited(getIt.init());
  runApp(MovieApp());
}


