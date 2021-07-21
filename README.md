
## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


在混合开发的应用中，原生Android、iOS与Flutter各自实现了一套互不相同的页面映射机制，原生平台采用的是单容器单页面，即一个ViewController或Activity对应一个原生页面；而Flutter采用单容器多页面的机制，即一个ViewController或Activity对应多个Flutter页面。Flutter在原生的导航栈之上又自建了一套Flutter导航栈，这使得原生页面与Flutter页面与之间进行页面切换时，需要处理跨引擎的页面切换问题。


runApp()执行契机: 如果通过:flutter module 依赖的方式,在初始化FlutterEngine时就执行了`runApp()`函数.

> 如果多个原生页面使用同一个FlutterEngine开启不同的页面,需要使用组件进行Navigator去跳转.

#### [shared_preferences](https://pub.dev/packages/shared_preferences)

存储简单的数据, NSUserDefaults on iOS and macOS, SharedPreferences on Android, 
基本使用: 

```dart
    void serialize(){
          /// 设置保存数据, 这里需要调用原生api是异步
          Global.prefs.setBool('key',true);
          /// 获取数据是同步的, 是由前部进行缓存的.
          int value = Global.prefs.getInt('key') ?? 0; 
    } 
    
```

#### [webview_flutter](https://pub.dev/documentation/webview_flutter/latest/webview_flutter/WebView-class.html)

Flutter 本身并没有提供webView组件
On iOS the WebView widget is backed by a WKWebView; On Android the WebView widget is backed by a WebView.

> 如果需要获取WebView属性可以在`onWebViewCreated(controller)` 的 `controller`对象获取

#### [flutter_screenutil](https://github.com/OpenFlutter/flutter_screenutil/blob/master/README_CN.md)

屏幕适配方案-在创建App widget时初始化设计稿尺寸, 默认`dp`

```dart
    import 'package:flutter_screenutil/flutter_screenutil.dart';
    class App extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
            return ScreenUtilInit(
                   designSize: Size(375, 667),
                    builder: () => MaterialApp(
                        // ... 声明MaterialApp属性
                    )
            );
       }
    }
    /// 使用
    widgt build(){
      return Container(
                   width: 200.w,
                   height: 200.h,
                   child: Text("Hello",style: TextStyle(fontSize: 20.sp),)
                 );
      }
    
```

> 可以通过 `ScreenUtil.statusBarHeight` 设备栏的高度.

> 注意用到的地方都要主动导包, 可能会报红.
>
> 





### 特殊类说明

#####`dart.io.Platform` 关乎平台信息的类 
主要用于获取名称名称 : `Platform.operatingSystem' => 'android','ios','windows','macos','linux'.
可以使用:`Platform.isAndroid()`,`Platform.isIOS()` ...等方法判断当前运行平台名称.


##### `dart.ui.SystemChrome` 控制操作系统组件交互方面的样式.

`SystemChrome.setSystemUIOverlayStyle()` 设置系统状态栏,导航栏的样式

```dart
void init(){ 
    SystemChrome.setSystemUIOverlayStyle(
         SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarBrightness: Brightness.dark),
     );}
```

> 其他Api , 暂不列举...


##### `dart.core.bool` 获取当前编译环境

flutter: 当前有3种编译环境, `release`,`profile`,`debug`;
`release` 用于生产环境
`profile` 用于性能检测
`debug` 用于开发调试环境

```dart
bool isProduct = bool.fromEnvironment('dart.vm.product',false);
bool isProfile = bool.fromEnvironment('dart.vm.profile',false);
```

对于`fromEnvironment()`所有基本类型都有该方法.

响应点击事件:
1. 直接使用系统组件, 例如button相关
2. 使用InkWell容器对需要点击事件的模块进行包裹
3. 实现GestureDetector进行事件获取

获取状态栏高度:
```dart
  import 'dart:ui';
  
// 通过window对象活得
  double _statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
```
