import 'package:flutter/cupertino.dart';
import 'package:my_movie_app/common/constants/size_constants.dart';
import 'package:my_movie_app/common/screenutil/screenutil.dart';
import 'package:my_movie_app/domain/entities/movie_entity.dart';
import 'package:my_movie_app/presentation/journeys/home/movie_carousel/animated_movie_card_widget.dart';
import 'package:my_movie_app/presentation/journeys/home/movie_carousel/movie_card_widget.dart';
import 'package:my_movie_app/common/extensions/size_extensions.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({Key key, @required this.movies, this.initialPage})
      : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: widget.initialPage,
        keepPage: false,
        viewportFraction: 0.7);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.w),
       height: ScreenUtil.screenHeight * 0.35,
       child: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            final MovieEntity movie = widget.movies[index];
            return AnimatedMovieCardWidget(
              index: index,
              pageController: _pageController,
              movieId: movie.id,
              posterPath: movie.posterPath,
            );
          },
          pageSnapping: true,
          itemCount: widget.movies?.length ?? 0,
          onPageChanged: (index){},
        )
    );
  }
}
