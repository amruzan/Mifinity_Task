part of 'all_category_bloc.dart';

class AllCategoryState {
  BlocEventState eventState;
  List<ImageList>? imageList;
  List<String>? recommended;
  String message;

  AllCategoryState(
      {this.eventState = BlocEventState.LOADING,
      this.imageList,
      this.recommended,
      this.message = ""});
}

class AllCategoryInitialState extends AllCategoryState {
  AllCategoryInitialState() : super(eventState: BlocEventState.LOADING);
}

class AllCategoryLoadedState extends AllCategoryState {
  final List<ImageList> list;

  AllCategoryLoadedState({required this.list})
      : super(imageList: list, eventState: BlocEventState.LOADED);
}

class AllCategoryErrorState extends AllCategoryState {
  final String message;

  AllCategoryErrorState(this.message)
      : super(eventState: BlocEventState.ERROR, message: message);
}
