import 'package:flutter/material.dart';
import 'package:mifinity_coding_task/presentation/dashboard/profile/profile_widget.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CircleAvatar(
            backgroundImage: const AssetImage('assets/images/profile.jpeg'),
            radius: 5.h,
          ),
          SizedBox(
            height: 1.h,
          ),
          const Text(
            'Hello, Susan',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 1.h,
          ),
          const Text(
            'Happy Movie Watching!',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
              height: 40.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ProfileWidget(
                        activityName: 'Movies Watched',
                        icon: Icons.list,
                      ),
                      ProfileWidget(
                        activityName: 'Movies Downloaded',
                        icon: Icons.download,
                      ),
                      ProfileWidget(
                        activityName: 'Favourite Movies',
                        icon: Icons.favorite,
                      ),
                      ProfileWidget(
                        activityName: 'Settings',
                        icon: Icons.settings,
                      ),
                    ]),
              )),
        ]),
      ),
    );
  }
}
