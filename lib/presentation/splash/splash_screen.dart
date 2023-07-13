import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mifinity_coding_task/common/config/router.gr.dart';
import 'package:mifinity_coding_task/model/boximages.dart';
import 'package:mifinity_coding_task/model/imagelist.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  int currTimer = 0;

  @override
  void initState() {
    boxImages.put('key_img1',
        ImageList(id: 1, name: 'avatar.jpeg', category: 'newMovies'));
    boxImages.put('key_img2',
        ImageList(id: 2, name: 'Mandolan.jpeg', category: 'newMovies'));
    boxImages.put(
        'key_img3', ImageList(id: 3, name: 'mario.jpg', category: 'newMovies'));
    boxImages.put(
        'key_img4', ImageList(id: 4, name: 'frozen.jpeg', category: 'kids'));
    boxImages.put('key_img5',
        ImageList(id: 5, name: 'spiderman.jpg', category: 'recommended'));
    boxImages.put('key_img6',
        ImageList(id: 6, name: 'jurassic_park.jpg', category: 'recommended'));
    boxImages.put('key_img7',
        ImageList(id: 7, name: 'captain_marvel.jpeg', category: 'recommended'));
    boxImages.put('key_img8',
        ImageList(id: 8, name: 'doolittke.jpeg', category: 'recommended'));
    boxImages.put('key_img9',
        ImageList(id: 9, name: 'mulan.jpeg', category: 'newMovies'));
    boxImages.put(
        'key_img10', ImageList(id: 10, name: 'shrek.png', category: 'kids'));
    boxImages.put('key_img11',
        ImageList(id: 11, name: 'TheLostCity.jpeg', category: 'recommended'));
    boxImages.put(
        'key_img12', ImageList(id: 12, name: 'mario.jpg', category: 'kids'));
    boxImages.put(
        'key_img13', ImageList(id: 13, name: 'charlie.jpeg', category: 'kids'));
    boxImages.put('key_img14',
        ImageList(id: 14, name: 'kung_fu_panda.jpeg', category: 'kids'));
    super.initState();
    startTimer();
  }

  // startTimer() async {
  //   var duration = const Duration(seconds: 5);
  //   return Timer(duration, route);
  // }
  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      if (mounted) {
        setState(() {
          currTimer = t.tick;
        });
      }
    });
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    context.router.replace(const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).disabledColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Launching...',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.red),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 10.h,
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: ListView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 2.h,
                              width: 3.w,
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.red)),
                              child: Container(
                                  height: 2.h,
                                  width: 3.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (currTimer % 4) == index
                                        ? Colors.black
                                        : Colors.red,
                                  )));
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children:  [
//             const Text('Launching...',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.red),),
//             SizedBox(height: 1.h,),
//             const CircularProgressIndicator(color: Colors.white,)
//           ],
//         ),
//       ),
//     );
//   }
// }
