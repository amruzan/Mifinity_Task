import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mifinity_coding_task/common/config/router.gr.dart';
import 'package:mifinity_coding_task/presentation/dashboard/profile/profile_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
              SizedBox(height: 5.h,),
              SizedBox(
                width: double.infinity,
                height: 7.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white10)),
                      backgroundColor: Colors.black),
                  onPressed: () async{
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            title: const Center(child: Text('Are you sure you want to sign out?',textAlign: TextAlign.center,)),
                            actions: [
                              TextButton(
                                  onPressed: () async{
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    if(prefs.containsKey('userEmail')){
                                      prefs.remove('userEmail');
                                    }
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully logged out!")));
                                    context.router.replace(const LoginScreen());
                                  },
                                  child: const Text('Yes',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600),)),
                              TextButton(
                                  onPressed: () {
                                    context.router.pop();
                                  },
                                  child: const Text('No',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)))
                            ],
                          );
                        });
                  },
                  child: const Text('Logout'),
                ),
              ),
        ]),
      ),
    );
  }
}
