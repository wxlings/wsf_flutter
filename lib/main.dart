import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wsf_flutter/global.dart';
import 'package:wsf_flutter/pages/guide/splash.dart';
import 'package:wsf_flutter/routes.dart';

void main() => Global.init().then((value) => runApp(App()));

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 可以用开发快捷启动
    String _initRoute = "/";

    return ScreenUtilInit(
        designSize: Size(375, 667),
        builder: () => MaterialApp(
              initialRoute: _initRoute,
              routes: routes,
              home: SplashPage(),
              debugShowCheckedModeBanner: true,
            ));
  }
}
