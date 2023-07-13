import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mifinity_coding_task/common/config/router.gr.dart';
import 'package:mifinity_coding_task/presentation/dashboard/home/widgets/recommended.dart';
import 'package:sizer/sizer.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      width: 58.w,
                      child: TextFormField(
                        controller: _controller,
                        decoration: const InputDecoration(
                            hintText: 'Search Movies By Name...',
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                            border: InputBorder.none),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: InkWell(
                            child: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              if (_controller.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please enter something before search')));
                              } else {
                                context.router.push(
                                    SearchResult(searchName: _controller.text));
                                setState(() {
                                  _controller.clear();
                                });
                              }
                            })),
                  ]),
            ),
            SizedBox(
              height: 5.h,
            ),
            const Text(
              'Recommended',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(height: 35.h, child: const Recommended()),
          ],
        ),
      ),
    );
  }
}
