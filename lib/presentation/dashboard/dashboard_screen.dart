import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mifinity_coding_task/common/config/router.gr.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      lazyLoad: false,
      routes: const [HomeScreen(), Search(), DownloadScreen(), Profile()],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(label: 'Search', icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                label: 'Download', icon: Icon(Icons.download)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ],
        );
      },
    );
  }
}
