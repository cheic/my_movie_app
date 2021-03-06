import 'package:flutter/cupertino.dart';
import 'package:my_movie_app/domain/entities/movie_entity.dart';
import 'package:my_movie_app/presentation/widgets/movie_app_bar.dart';

import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget(
      {Key key, @required this.movies, @required this.defaultIndex})
      : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieAppBar(),
        MoviePageView(
          movies: movies,
          initialPage: defaultIndex,
        ),
      ],
    );
  }
}
