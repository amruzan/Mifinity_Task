part of 'search_bloc.dart';
class SearchState {
  BlocEventState eventState;
  List<String>? searchList;
  String message;
  SearchState(
      {this.eventState = BlocEventState.LOADING, this.searchList, this.message = ""});
}

class SearchInitialState extends SearchState {
  SearchInitialState() : super(eventState: BlocEventState.LOADING);
}

class SearchLoadedState extends SearchState {
  final List<String> searchList;

  SearchLoadedState({required this.searchList})
      : super(searchList: searchList, eventState: BlocEventState.LOADED);
}


class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState(this.message)
      : super(eventState: BlocEventState.ERROR, message: message);
}



