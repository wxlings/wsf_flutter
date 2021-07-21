import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences prefs;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    if (Platform.isAndroid) {
      // 设置状态栏为透明色(Android) 仅需要初始化一次即可(完全依附在一个Activity)
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    }

    // todo 初始化全局对象 ...
  }
}
