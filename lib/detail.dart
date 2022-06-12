import 'dart:async';
//import 'dart:io';
//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:infos_app/models/articles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Detail extends StatefulWidget {
  final Articles? articles;
  Detail(this.articles);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Completer<WebViewController> completer = Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (Platform.isWindows) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.articles!.title!),
          actions: [],
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: widget.articles!.url!,
        ),
    );
  }
}
