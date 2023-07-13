part of 'recommended_bloc.dart';

class RecommendedState {
  BlocEventState eventState;
  List<String>? recommended;
  String message;

  RecommendedState(
      {this.eventState = BlocEventState.LOADING,
      this.recommended,
      this.message = ""});
}

class RecommendedInitialState extends RecommendedState {
  RecommendedInitialState() : super(eventState: BlocEventState.LOADING);
}

class RecommendedLoadedState extends RecommendedState {
  final List<String> recommended;

  RecommendedLoadedState({required this.recommended})
      : super(recommended: recommended, eventState: BlocEventState.LOADED);
}

class RecommendedErrorState extends RecommendedState {
  final String message;

  RecommendedErrorState(this.message)
      : super(eventState: BlocEventState.ERROR, message: message);
}
