import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mifinity_coding_task/bloc/search/search_bloc.dart';
import 'package:mifinity_coding_task/presentation/common/bloc_map.dart';
import 'package:sizer/sizer.dart';

class SearchResult extends StatelessWidget {
  final String searchName;

  const SearchResult({Key? key, required this.searchName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            SearchBloc()..add(LoadSearchEvent(searchName: searchName)),
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            return BlocMapToEvent(
              state: state.eventState,
              message: state.message,
              child: getSearchItems(state),
            );
          }),
        ));
  }

  getSearchItems(SearchState state) {
    List<String>? searchResults = state.searchList;
    List<String>? distinctResults = searchResults?.toSet().toList();

    return ((searchResults ?? []) == [] || searchResults?.length == 0)
        ? const Center(
            child: Text(
              'No matching results found!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Search Results',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Center(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: distinctResults?.map((e) {
                          return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 1.w, vertical: 1.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.w, vertical: 1.h),
                              height: 30.h,
                              child: Image.asset(
                                'assets/images/$e',
                              ));
                        }).toList() ??
                        [],
                  ),
                ),
              ],
            ),
          );
  }
}
