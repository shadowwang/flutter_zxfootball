import 'package:flutter/material.dart';

import 'custom/CustomUnderLineTabIndicator.dart';

class ZxFootballTabBarWidget extends StatefulWidget {

  final List<Widget> tabItems;

  final List<Widget> itemViews;

  final Color indicatorColor;

  final Color backgroundColor;

  final PageController pageController;

  ZxFootballTabBarWidget({
      Key key,
      this.tabItems,
      this.itemViews,
      this.indicatorColor,
      this.backgroundColor,
      this.pageController
    }): super(key: key);

  @override
  _ZxFootballTabBarWidgetState createState() {
    return _ZxFootballTabBarWidgetState(tabItems, itemViews, indicatorColor, backgroundColor, pageController);
  }
}

class _ZxFootballTabBarWidgetState extends State<ZxFootballTabBarWidget> with SingleTickerProviderStateMixin {

  final List<Widget> _tabItems;

  final List<Widget> _itemViews;

  final Color _indicatorColor;

  final Color _backgroundColor;

  final PageController _pageController;

  _ZxFootballTabBarWidgetState(this._tabItems, this._itemViews, this._indicatorColor, this._backgroundColor, this._pageController) :super();

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (_tabController != null) {
      _tabController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_tabItems.length > 0 && _tabController == null) {
      _tabController = new TabController( vsync: this, length: _tabItems.length);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text("新闻")),
        backgroundColor: _backgroundColor,
        bottom: new TabBar(
          ///顶部时，tabBar为可以滑动的模式
          isScrollable: true,
          ///必须有的控制器，与pageView的控制器同步
          controller: _tabController,
          ///每一个tab item，是一个List<Widget>
          tabs: _tabItems,
          ///tab选中的下划线
          indicator: new CustomUnderLineTabIndicator(),
          ///tab底部选中条颜色
          labelColor: Colors.lightBlue,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),  
      body: new PageView(
        controller: _pageController,
        children: _itemViews,
        onPageChanged: (index) => _tabController.animateTo(index)
      ),
    );
  }

}