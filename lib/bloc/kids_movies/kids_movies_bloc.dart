
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mifinity_coding_task/common/enum/bloc_state.dart';
import 'package:mifinity_coding_task/model/imagelist.dart';

part 'kids_movies_event.dart';
part 'kids_movies_state.dart';

class KidsMoviesBloc extends Bloc<KidsMoviesEvent, KidsMoviesState> {
  KidsMoviesBloc() : super(KidsMovieInitialState()) {
    on<KidsMoviesEvent>(_init);
  }

  void _init(KidsMoviesEvent event, Emitter<KidsMoviesState> emit) async {
    emit(KidsMovieInitialState());

    Box<ImageList> box = Hive.box('imageBox');
    List<ImageList> allImages = box.values.toList();
    if(event is LoadKidsMovieEvent) {
      List<String> kidsMovie = [];
      try {
        for (var element in allImages) {
          if (element.category == 'kids') {
            kidsMovie.add(element.name);
          }
        }
        emit(KidsMovieLoadedState(kidsMovie: kidsMovie));
      }catch(e){
        emit(KidsMovieErrorState(e.toString()));
      }
    }
  }
}
