import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mifinity_coding_task/common/enum/bloc_state.dart';
import 'package:mifinity_coding_task/model/imagelist.dart';

part 'new_movies_event.dart';

part 'new_movies_state.dart';

class NewMoviesBloc extends Bloc<NewMoviesEvent, NewMoviesState> {
  NewMoviesBloc() : super(NewMovieInitialState()) {
    on<NewMoviesEvent>(_init);
  }

  void _init(NewMoviesEvent event, Emitter<NewMoviesState> emit) async {
    emit(NewMovieInitialState());

    Box<ImageList> box = Hive.box('imageBox');
    List<ImageList> allImages = box.values.toList();
    if (event is LoadNewMovies) {
      List<String> newMovie = [];
      try {
        for (var element in allImages) {
          if (element.category == 'newMovies') {
            newMovie.add(element.name);
          }
        }
        emit(NewMovieLoadedState(newMovie: newMovie));
      } catch (e) {
        emit(NewMovieErrorState(e.toString()));
      }
    }
  }
}
