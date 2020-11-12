import 'package:flutter/material.dart';
import 'package:xuchao/utils/util.dart';

class SettingDetailPage extends StatefulWidget {
  SettingDetailPage({Key key, this.params}) : super(key: key);
  final params;

  @override
  _SettingDetailPageState createState() => _SettingDetailPageState();
}

class _SettingDetailPageState extends State<SettingDetailPage> {
  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  // ThemeData _themeData = themePink;

  // void _incrementCounter() {
  //   _counter.increment(); // 改变状态管中的值
  // }

  @override
  Widget build(BuildContext context) {
    // _theme = Provider.of<ThemeStore>(context);
    // _counter = Provider.of<CounterStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('全局主题'),
        centerTitle: true,
      ),
      // body:
      body: ListView(
          children: ListTile.divideTiles(context: context, tiles: [
        ListTile(
          title: Text('天空蓝'),
          trailing: Icon(Icons.check),
          onLongPress: () {
            Navigator.pushNamed(context, '/loginPage');
          },
        ),
        ListTile(
          title: Text('狼烟灰'),
          trailing: Icon(Icons.check),
          onLongPress: () {
            Navigator.pushNamed(context, '/loginPage');
          },
        ),
        ListTile(
          title: Text('B站粉'),
          trailing: Icon(Icons.check),
          onLongPress: () {
            Navigator.pushNamed(context, '/loginPage');
          },
        ),
      ]).toList()),
    );
  }
}
