import 'package:flutter/material.dart';
import 'package:xuchao/models/device/device_model.dart';
import 'package:xuchao/models/tabIcon_data.dart';
import 'package:xuchao/pages/AppHomePage/Home/home_theme.dart';
import 'package:xuchao/pages/AppHomePage/Home/theme/device_screen.dart';
import 'package:xuchao/pages/AppHomePage/Shop/theme/extention.dart';

class DeviceMain extends StatefulWidget {
  DeviceMain({Key key, this.params}) : super(key: key);
  final params;
  final ApplianceModel model = ApplianceModel();

  @override
  _DeviceMainState createState() => _DeviceMainState();
}

class _DeviceMainState extends State<DeviceMain>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: HomeTheme.background,
  );

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = DeviceScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget _appBar() {
      return AppBar(
        elevation: 0,
        title: new Text('若水'),
        centerTitle: true,
        leading: Icon(
          Icons.short_text,
          size: 30,
          color: Colors.black,
        ),
        actions: <Widget>[
          // 非隐藏的菜单
          new IconButton(
              icon: new Icon(Icons.bluetooth),
              tooltip: '蓝牙连接',
              onPressed: () {
                Navigator.pushNamed(context, '/deviceScreen');
              }),
          new IconButton(
              icon: new Icon(Icons.notifications_none),
              tooltip: '消息提醒',
              onPressed: () {
                Navigator.pushNamed(context, '/userProfile');
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

    Future<bool> getData() async {
      await Future<dynamic>.delayed(const Duration(milliseconds: 200));
      return true;
    }

    return Container(
      color: HomeTheme.background,
      child: Scaffold(
        appBar: _appBar(),
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
