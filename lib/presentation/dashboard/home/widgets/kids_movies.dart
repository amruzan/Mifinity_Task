import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mifinity_coding_task/bloc/kids_movies/kids_movies_bloc.dart';
import 'package:mifinity_coding_task/presentation/common/bloc_map.dart';
import 'package:sizer/sizer.dart';

class KidsMovies extends StatelessWidget {
  const KidsMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KidsMoviesBloc()..add(LoadKidsMovieEvent()),
      child: BlocBuilder<KidsMoviesBloc, KidsMoviesState>(
          builder: (context, state) {
        return BlocMapToEvent(
          state: state.eventState,
          message: '',
          child: getKidsMovieImages(state),
        );
      }),
    );
  }

  getKidsMovieImages(KidsMoviesState state) {
    List<String>? kidsMovies = state.kidsMovie;
    return ((kidsMovies ?? []) == [])
        ? const SizedBox.shrink()
        : ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: kidsMovies?.length,
            itemBuilder: (_, index) {
              return Container(
                  width: 35.w,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(
                              'assets/images/${kidsMovies?[index]}'))));
            });
  }
}
