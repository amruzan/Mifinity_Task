// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../presentation/dashboard/dashboard_screen.dart' as _i3;
import '../../presentation/dashboard/download/download.dart' as _i7;
import '../../presentation/dashboard/home/home_screen.dart' as _i5;
import '../../presentation/dashboard/profile/profile.dart' as _i8;
import '../../presentation/dashboard/search/search.dart' as _i6;
import '../../presentation/dashboard/search/search_result.dart' as _i4;
import '../../presentation/login/login_screen.dart' as _i2;
import '../../presentation/splash/splash_screen.dart' as _i1;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    Dashboard.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.Dashboard(),
      );
    },
    SearchResult.name: (routeData) {
      final args = routeData.argsAs<SearchResultArgs>();
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.SearchResult(
          key: args.key,
          searchName: args.searchName,
        ),
      );
    },
    HomeScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    Search.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.Search(),
      );
    },
    DownloadScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.DownloadScreen(),
      );
    },
    Profile.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.Profile(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash-screen',
          fullMatch: true,
        ),
        _i9.RouteConfig(
          SplashScreen.name,
          path: 'splash-screen',
        ),
        _i9.RouteConfig(
          LoginScreen.name,
          path: 'login-page',
        ),
        _i9.RouteConfig(
          Dashboard.name,
          path: '/Dashboard',
          children: [
            _i9.RouteConfig(
              HomeScreen.name,
              path: 'home-screen',
              parent: Dashboard.name,
            ),
            _i9.RouteConfig(
              Search.name,
              path: 'Search',
              parent: Dashboard.name,
            ),
            _i9.RouteConfig(
              DownloadScreen.name,
              path: 'download-screen',
              parent: Dashboard.name,
            ),
            _i9.RouteConfig(
              Profile.name,
              path: 'Profile',
              parent: Dashboard.name,
            ),
          ],
        ),
        _i9.RouteConfig(
          SearchResult.name,
          path: 'search-result',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i9.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: 'splash-screen',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreen extends _i9.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: 'login-page',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i3.Dashboard]
class Dashboard extends _i9.PageRouteInfo<void> {
  const Dashboard({List<_i9.PageRouteInfo>? children})
      : super(
          Dashboard.name,
          path: '/Dashboard',
          initialChildren: children,
        );

  static const String name = 'Dashboard';
}

/// generated route for
/// [_i4.SearchResult]
class SearchResult extends _i9.PageRouteInfo<SearchResultArgs> {
  SearchResult({
    _i10.Key? key,
    required String searchName,
  }) : super(
          SearchResult.name,
          path: 'search-result',
          args: SearchResultArgs(
            key: key,
            searchName: searchName,
          ),
        );

  static const String name = 'SearchResult';
}

class SearchResultArgs {
  const SearchResultArgs({
    this.key,
    required this.searchName,
  });

  final _i10.Key? key;

  final String searchName;

  @override
  String toString() {
    return 'SearchResultArgs{key: $key, searchName: $searchName}';
  }
}

/// generated route for
/// [_i5.HomeScreen]
class HomeScreen extends _i9.PageRouteInfo<void> {
  const HomeScreen()
      : super(
          HomeScreen.name,
          path: 'home-screen',
        );

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i6.Search]
class Search extends _i9.PageRouteInfo<void> {
  const Search()
      : super(
          Search.name,
          path: 'Search',
        );

  static const String name = 'Search';
}

/// generated route for
/// [_i7.DownloadScreen]
class DownloadScreen extends _i9.PageRouteInfo<void> {
  const DownloadScreen()
      : super(
          DownloadScreen.name,
          path: 'download-screen',
        );

  static const String name = 'DownloadScreen';
}

/// generated route for
/// [_i8.Profile]
class Profile extends _i9.PageRouteInfo<void> {
  const Profile()
      : super(
          Profile.name,
          path: 'Profile',
        );

  static const String name = 'Profile';
}
