import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'router.gr.dart';

class InitRoot extends StatefulWidget {
  const InitRoot({
    super.key,
  });

  @override
  State<InitRoot> createState() => _InitRootState();
}

class _InitRootState extends State<InitRoot> {
  late final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        );
      },
    );
  }
}
