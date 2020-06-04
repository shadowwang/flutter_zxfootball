import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'TabBarPageWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    return new ZxFootballNewsPage();
  }
}

class ZxFootballNewsPage extends State {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterBoost.singleton.registerPageBuilders({
      //对应的Page的名字，最好是类Http格式
      '/': (pageName, params, _) {
        return TabBarPageWidget();
      },
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'News',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
    );
  }

  void _onRoutePushed(
      String pageName,
      String uniqueId,
      Map<String, dynamic> params,
      Route<dynamic> route,
      Future<dynamic> _,
      ) {}
}
