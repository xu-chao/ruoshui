import 'package:flutter/material.dart';
import 'package:xuchao/pages/AppHomePage/Shop/theme/extention.dart';
import 'package:xuchao/utils/util.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key, this.params}) : super(key: key);
  final params;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  // void _incrementCounter() {
  //   _counter.increment(); // 改变状态管中的值
  // }

  @override
  Widget build(BuildContext context) {
    // _counter = Provider.of<CounterStore>(context);
    Widget _appBar() {
      return AppBar(
        elevation: 0,
        // backgroundColor: Theme.of(context).backgroundColor,
        title: new Text('设置'),
        centerTitle: true,
        leading: Icon(
          Icons.short_text,
          size: 30,
          color: Colors.black,
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.person),
              tooltip: '设置',
              onPressed: () {
                Navigator.pushNamed(context, '/testDemo');
              }),
          GestureDetector(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                ),
                child: Image.asset("asset/device/avatar.png", fit: BoxFit.fill),
              ),
            ).p(8),
            onTap: () {
              Navigator.pushNamed(context, '/userProfile');
            },
          )
        ],
      );
    }

    return Scaffold(
      appBar: _appBar(),
      body: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
        ListTile(
            title: Text('语言'),
            subtitle: Text('zh'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, '/settingPageView');
            }),
        ListTile(
            title: Text('主题'),
            subtitle: Text('天空蓝'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, '/userPage');
            }),
        ListTile(
            title: Text('版本'),
            trailing: Text('1.0.1', style: TextStyle(fontSize: 15)))
      ]).toList()),
    );
  }
}
