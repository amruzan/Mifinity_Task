import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mifinity_coding_task/bloc/new_movies/new_movies_bloc.dart';
import 'package:mifinity_coding_task/presentation/common/bloc_map.dart';
import 'package:sizer/sizer.dart';

class NewMovies extends StatelessWidget {
  const NewMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewMoviesBloc()..add(LoadNewMovies()),
      child:
          BlocBuilder<NewMoviesBloc, NewMoviesState>(builder: (context, state) {
        return BlocMapToEvent(
          state: state.eventState,
          message: state.message,
          child: getNewMovieImages(state),
        );
      }),
    );
  }

  getNewMovieImages(NewMoviesState state) {
    List<String>? newMovies = state.newMovie;
    return ((newMovies ?? []) == [])
        ? const SizedBox.shrink()
        : ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: newMovies?.length,
            itemBuilder: (_, index) {
              return Container(
                  width: 35.w,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(
                              'assets/images/${newMovies?[index]}'))));
            });
  }
}
