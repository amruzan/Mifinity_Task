part of 'kids_movies_bloc.dart';

class KidsMoviesState {
  BlocEventState eventState;
  List<String>? kidsMovie;
  String message;
  KidsMoviesState({this.eventState = BlocEventState.LOADING,this.kidsMovie, this.message = ""});
}

class KidsMovieInitialState extends KidsMoviesState {
  KidsMovieInitialState() : super(eventState: BlocEventState.LOADING);
}

class KidsMovieLoadedState extends KidsMoviesState {
  final List<String> kidsMovie;

  KidsMovieLoadedState({required this.kidsMovie})
      : super(kidsMovie: kidsMovie, eventState: BlocEventState.LOADED);
}

class KidsMovieErrorState extends KidsMoviesState {
  final String message;

  KidsMovieErrorState(this.message)
      : super(eventState: BlocEventState.ERROR, message: message);
}

