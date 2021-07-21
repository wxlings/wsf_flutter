import 'package:flutter/material.dart';

import 'pages/guide/protocol.dart';
import 'pages/guide/splash.dart';
import 'pages/login/login.dart';
import 'pages/main/index.dart';
import 'pages/web.dart';

/// 路由管理:
///
/// 每新增一个页面都需要在这里声明,如果需要跳转建议使用变量

// 过度页
const String SPLASH_PAGE = "splash";
// 登陆页
const String LOGIN_PAGE = "login";
// 注册页
const String REGISTER_PAGE = "register";
// 首页
const String MAIN_PAGE = "main";
// 用户协议
const String PROTOCOL_PAGE = "protocol";
// 用户未登陆guide
const String GUIDE_PAGE = 'guide';
// WebView页
const String WEB_VIEW_PAGE = 'web_view';

final Map<String, WidgetBuilder> routes = {
  SPLASH_PAGE: (context) => SplashPage(),
  LOGIN_PAGE: (context) => LoginPage(),
  REGISTER_PAGE: (context) => RegisterPage(),
  PROTOCOL_PAGE: (context) => ProtocolPage(),
  GUIDE_PAGE: (context) => GuidePage(),
  MAIN_PAGE: (context) => MainPage(),
  WEB_VIEW_PAGE: (context) =>
      WebPage(ModalRoute.of(context).settings.arguments),
};
