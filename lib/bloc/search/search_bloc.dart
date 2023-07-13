import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mifinity_coding_task/common/enum/bloc_state.dart';
import 'package:mifinity_coding_task/model/imagelist.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState()) {
    on<SearchEvent>(_init);
  }

  void _init(SearchEvent event, Emitter<SearchState> emit) async {
    emit(SearchInitialState());
    Box<ImageList> box = Hive.box('imageBox');
    List<ImageList> allImages = box.values.toList();

    if (event is LoadSearchEvent) {
      try {
        String searchItem = event.searchName;
        List<String> searchImageNames = [];
        for (var element in allImages) {
          if (element.name.contains(searchItem)) {
            searchImageNames.add(element.name);
          }
        }
        emit(SearchLoadedState(searchList: searchImageNames));
      } catch (e) {
        emit(SearchErrorState(e.toString()));
      }
    }
  }
}
