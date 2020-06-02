import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ZxFootabllNewsAll.dart';
import 'ZxFootabllNewsTransfer.dart';
import 'ZxFootballTabBarWidget.dart';
class TabBarPageWidget extends StatefulWidget {

  @override
  _TabBarPageWidgetState createState() {

    return _TabBarPageWidgetState();
  }
}

class _TabBarPageWidgetState extends State<TabBarPageWidget> {

  //获取tab的channel
  static const platform = const MethodChannel("zxfootball.news.getnewstab");

//  List<dynamic> tabs;// = ["全部","转会", "转会留言", "统计", "球员动态", "球队动态", "球队身价"];

  //tab选项页
  List<Widget> tabWidgets = new List();
  //每个tab选项页对应的页面
  List<Widget> itemViews = new List();

  PageController pageController;
  Future<Null> _getNewsTabs() async {
    List<dynamic> tabs;
    try {
      tabs = await platform.invokeMethod("getNewsTabs");
    } on PlatformException catch (e) {
    }
    setState(() {
      print("_ZxFootballTabBarWidgetState---setState---$tabs");
      if (tabs != null && tabs.length > 0) {
        for (int i = 0; i < tabs.length; i++) {
          tabWidgets.add(new FlatButton(onPressed: () {
            topPageController.jumpTo(MediaQuery.of(context).size.width * i);
          }, child: new Text(tabs[i], maxLines: 1)));

          itemViews.add(new ZxFootballNewsAllPage());
        }
        pageController = new PageController();
      }
    });
  }

  final PageController topPageController = new PageController();

  _renderPage() {
    return [
      new ZxFootballNewsAllPage(),
      new ZxFootballNewsTransferPage(),
      new ZxFootballNewsAllPage(),
      new ZxFootballNewsTransferPage(),
      new ZxFootballNewsAllPage(),
      new ZxFootballNewsTransferPage(),
      new ZxFootballNewsAllPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    print("_ZxFootballTabBarWidgetState---build--ZxFootballTabBarWidget");
    return new ZxFootballTabBarWidget(
      tabItems: tabWidgets,
      itemViews: itemViews,
      indicatorColor: Color(int.parse("0x2E7461")),
      backgroundColor: Color(int.parse("0x252E34")),
      pageController: pageController
    );
  }

  @override
  void initState() {
    super.initState();
    _getNewsTabs();
  }
}
