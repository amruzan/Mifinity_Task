import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mifinity_coding_task/common/enum/bloc_state.dart';
import 'package:mifinity_coding_task/model/imagelist.dart';

part 'all_category_event.dart';

part 'all_category_state.dart';

class AllCategoryBloc extends Bloc<AllCategoryEvent, AllCategoryState> {
  AllCategoryBloc() : super(AllCategoryInitialState()) {
    on<AllCategoryEvent>(_init);
  }

  void _init(AllCategoryEvent event, Emitter<AllCategoryState> emit) async {
    emit(AllCategoryInitialState());
    Box<ImageList> box = Hive.box('imageBox');
    List<ImageList> allImages = box.values.toList();
    if (event is MainEvent) {
      try {
        List<String> imageNames = [];
        for (var element in allImages) {
          imageNames.add(element.name);
        }
        emit(AllCategoryLoadedState(list: allImages));
      } catch (e) {
        emit(AllCategoryErrorState(e.toString()));
      }
    }
  }
}
