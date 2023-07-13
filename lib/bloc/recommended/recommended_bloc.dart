import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mifinity_coding_task/common/enum/bloc_state.dart';
import 'package:mifinity_coding_task/model/imagelist.dart';

part 'recommended_event.dart';

part 'recommended_state.dart';

class RecommendedBloc extends Bloc<RecommendedEvent, RecommendedState> {
  RecommendedBloc() : super(RecommendedInitialState()) {
    on<RecommendedEvent>(_init);
  }

  void _init(RecommendedEvent event, Emitter<RecommendedState> emit) async {
    emit(RecommendedInitialState());

    Box<ImageList> box = Hive.box('imageBox');
    List<ImageList> allImages = box.values.toList();
    if (event is GetRecommendedEvent) {
      List<String> recommended = [];
      try {
        for (var element in allImages) {
          if (element.category == 'recommended') {
            recommended.add(element.name);
          }
        }
        emit(RecommendedLoadedState(recommended: recommended));
      } catch (e) {
        emit(RecommendedErrorState(e.toString()));
      }
    }
  }
}
