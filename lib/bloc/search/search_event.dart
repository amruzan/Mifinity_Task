part of 'search_bloc.dart';

abstract class SearchEvent {}

class LoadSearchEvent extends SearchEvent {
  final searchName;

  LoadSearchEvent({required this.searchName});
}
