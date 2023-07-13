part of 'new_movies_bloc.dart';

class NewMoviesState {
  BlocEventState eventState;
  List<String>? newMovie;
  String message;
  NewMoviesState({this.eventState = BlocEventState.LOADING,this.newMovie, this.message = ""});
}

class NewMovieInitialState extends NewMoviesState {
  NewMovieInitialState() : super(eventState: BlocEventState.LOADING);
}

class NewMovieLoadedState extends NewMoviesState {
  final List<String> newMovie;

  NewMovieLoadedState({required this.newMovie})
      : super(newMovie: newMovie, eventState: BlocEventState.LOADED);
}

class NewMovieErrorState extends NewMoviesState {
  final String message;

  NewMovieErrorState(this.message)
      : super(eventState: BlocEventState.ERROR, message: message);
}
