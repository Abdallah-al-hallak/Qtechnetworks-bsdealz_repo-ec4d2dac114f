
import 'dart:async';

import 'package:bsdealz/layouts/items/buttons/MainButton.dart';
import 'package:bsdealz/layouts/items/icons/AppIcon.dart';
import 'package:bsdealz/layouts/items/tobars/back_bar.dart';
import 'package:bsdealz/layouts/pages/credentials/login.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';


class ContentWebView extends StatefulWidget{
  final String url;

  const ContentWebView({super.key, required this.url});
  @override
  _ContentWebViewState createState() => _ContentWebViewState();
}

class _ContentWebViewState extends State<ContentWebView> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

   
    return
      Scaffold(
        body:  SafeArea(child:
        Column(
          children: [
            BackBar(height: 50, title:"", notificationsNumber: 0),
            Expanded(
              child: HtmlWidget(
                '<iframe src="${widget.url}"></iframe>',
                factoryBuilder: () => MyWidgetFactory(),
              ),
            ),
          ],
        ),
        // WebView(initialUrl: widget.url,
        //   javascriptMode: JavascriptMode.unrestricted,)
        ),
      );


  }
  @override
  void dispose() {
    super.dispose();
  }

}
class MyWidgetFactory extends WidgetFactory with WebViewFactory {}