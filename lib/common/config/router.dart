import 'package:auto_route/auto_route.dart';
import 'package:mifinity_coding_task/presentation/dashboard/dashboard_screen.dart';
import 'package:mifinity_coding_task/presentation/dashboard/download/download.dart';
import 'package:mifinity_coding_task/presentation/dashboard/home/home_screen.dart';
import 'package:mifinity_coding_task/presentation/dashboard/profile/profile.dart';
import 'package:mifinity_coding_task/presentation/dashboard/search/search.dart';
import 'package:mifinity_coding_task/presentation/dashboard/search/search_result.dart';
import 'package:mifinity_coding_task/presentation/login/login_screen.dart';
import 'package:mifinity_coding_task/presentation/splash/splash_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(initial: true, page: SplashScreen, path: 'splash-screen'),
  AutoRoute(page: LoginScreen, path: 'login-page'),
  AutoRoute(
    page: Dashboard,
    children: [
      AutoRoute(name: 'HomeScreen', page: HomeScreen),
      AutoRoute(
        name: 'Search',
        page: Search,
      ),
      AutoRoute(name: 'DownloadScreen', page: DownloadScreen),
      AutoRoute(name: 'Profile', page: Profile),
    ],
  ),
  AutoRoute(page: SearchResult, path: 'search-result')
])
class $AppRouter {}
