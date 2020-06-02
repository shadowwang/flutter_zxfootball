import 'package:flutter/material.dart';
class ZxFootballNewsAllPage extends StatefulWidget {

  @override
  _ZxFootballNewsAllPageState createState() {
    // TODO: implement createState
    return new _ZxFootballNewsAllPageState();
  }
}

class _ZxFootballNewsAllPageState extends State<ZxFootballNewsAllPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle blackStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black);
    TextStyle redStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.red);

    return new Center(
      //普通文本textview
//      child: new Text("文本是视图系统中的常见控件，用来显示一段特定样式的字符串，就比如 Android 里的 TextView，或是 iOS的UILabel",
//        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red)),

        //富文本textview
//        child:Text.rich(
//        TextSpan(
//          children: <TextSpan> [
//            TextSpan(text: '文本是视图系统中的常见控件，用来显示一段特定样式的字符串', style: blackStyle),
//            TextSpan(text: '就比如', style: blackStyle),
//            TextSpan(text: 'Android', style: redStyle),
//            TextSpan(text: '里的', style: blackStyle),
//            TextSpan(text: 'TextView', style: redStyle),
//          ]
//        ),
//      )
    child: FadeInImage.assetNetwork(placeholder: 'images/timg.gif', image: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568571374856&di=d95a26509dd89c850c31bd4f61ea1aaf&imgtype=0&src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201708%2F23%2F151402m7hbq6jj8zj9t806.jpg',
    fit: BoxFit.cover,
    width: 200,
    height: 200)
    );
  }

}