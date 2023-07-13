import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mifinity_coding_task/bloc/recommended/recommended_bloc.dart';
import 'package:mifinity_coding_task/presentation/common/bloc_map.dart';
import 'package:sizer/sizer.dart';

class Recommended extends StatelessWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendedBloc()..add(GetRecommendedEvent()),
      child: BlocBuilder<RecommendedBloc, RecommendedState>(
          builder: (context, state) {
        return BlocMapToEvent(
          state: state.eventState,
          message: '',
          child: getRecommendedImages(state),
        );
      }),
    );
  }

  getRecommendedImages(RecommendedState state) {
    List<String>? recommended = state.recommended;
    return ((recommended ?? []) == [])
        ? const SizedBox.shrink()
        : ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: recommended?.length,
            itemBuilder: (_, index) {
              return Container(
                  width: 35.w,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(
                              'assets/images/${recommended?[index]}'))));
            });
  }
}
