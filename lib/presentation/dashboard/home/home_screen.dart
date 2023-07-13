import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mifinity_coding_task/bloc/all_category/all_category_bloc.dart';
import 'package:mifinity_coding_task/model/imagelist.dart';
import 'package:mifinity_coding_task/presentation/common/bloc_map.dart';
import 'package:mifinity_coding_task/presentation/dashboard/home/widgets/kids_movies.dart';
import 'package:mifinity_coding_task/presentation/dashboard/home/widgets/new_movies.dart';
import 'package:mifinity_coding_task/presentation/dashboard/home/widgets/recommended.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllCategoryBloc()..add(MainEvent()),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'NETFLIX',
            style: TextStyle(
                fontSize: 25, color: Colors.red, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 15.h,
                child: BlocBuilder<AllCategoryBloc, AllCategoryState>(
                    builder: (context, state) {
                  return BlocMapToEvent(
                    state: state.eventState,
                    message: '',
                    child: getImages(state),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            const Text(
              "Recommended Movies",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              height: 20.h,
              child: const Recommended(),
            ),
            SizedBox(
              height: 3.h,
            ),
            const Text(
              "New Movies",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              height: 20.h,
              child: const NewMovies(),
            ),
            SizedBox(
              height: 3.h,
            ),
            const Text(
              "Kids Movies",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              height: 20.h,
              child: const KidsMovies(),
            ),
          ]),
        ),
      ),
    );
  }

  getImages(AllCategoryState state) {
    List<ImageList>? imageList = state.imageList;
    List<Widget> carouselImages = [];
    List<String> images = [];
    imageList?.forEach((element) {
      carouselImages.add(Image.asset('assets/images/${element.name}'));
    });
    imageList?.forEach((element) {
      images.add('assets/images/${element.name}');
    });

    return ((imageList ?? []) == [])
        ? const SizedBox.shrink()
        : CarouselSlider(
            items: images.map((item) {
              return Image.asset(
                height: 15.h,
                width: 100.w,
                item,
                fit: BoxFit.cover,
              );
            }).toList(),
            options: CarouselOptions(
              viewportFraction: .75,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          );

    // : SizedBox(
    //     height: 20.h,
    //     child: ListView.builder(
    //         shrinkWrap: true,
    //         scrollDirection: Axis.horizontal,
    //         itemCount: imageList?.length,
    //         itemBuilder: (_, index) {
    //           return Container(
    //               width: 90.w,
    //               margin: EdgeInsets.symmetric(horizontal: 2.w),
    //               decoration: BoxDecoration(
    //                   image: DecorationImage(
    //                       fit: BoxFit.fitWidth,
    //                       image: AssetImage(
    //                           'assets/images/${imageList?[index].name}'))));
    //         }),
    //   );
  }
}
