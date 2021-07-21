import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// 默认的WebViewPage, Android 使用`WebView`实现,IOS 使用 `WKWebView`实现
class WebPage extends StatefulWidget {
  const WebPage(this.url, {Key key, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  String _title;

  @override
  void initState() {
    super.initState();
    _title = widget.title ?? "";
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    // todo 可以初始化一些JS对象

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => {Navigator.of(context).pop()},
        ),
        title: Text(_title),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted, // 设置js执行不受限制
        onWebViewCreated: (controller) {
          if (_title.isEmpty) {
            controller.getTitle().then((value) {
              setState(() {
                _title = value;
              });
            });
          }
        },
      ),
    );
  }
}
