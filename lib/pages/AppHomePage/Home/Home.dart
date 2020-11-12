import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:xuchao/models/device/device_model.dart';
import 'package:xuchao/models/tabIcon_data.dart';
import 'package:xuchao/pages/AppHomePage/Home/main/drinks.dart';
import 'package:xuchao/pages/AppHomePage/Home/home_theme.dart';
import 'package:xuchao/pages/AppHomePage/Shop/theme/extention.dart';

class Home extends StatefulWidget {
  Home({Key key, this.params}) : super(key: key);
  final params;
  final ApplianceModel model = ApplianceModel();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: HomeTheme.background,
  );

  String debugLable; //错误信息
  final JPush jpush = new JPush(); //初始化极光插件

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = Drinks(animationController: animationController);
    super.initState();
    initPlatformState();
  }

  // 极光平台消息是异步的，所以我们用异步方法初始化。
  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        // print("flutter onReceiveNotification: $message");
        setState(() {
          debugLable = "flutter onReceiveNotification: $message";
        });
      }, onOpenNotification: (Map<String, dynamic> message) async {
        // print("flutter onOpenNotification: $message");
        setState(() {
          debugLable = "flutter onOpenNotification: $message";
        });
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        // print("flutter onReceiveMessage: $message");
        setState(() {
          debugLable = "flutter onReceiveMessage: $message";
        });
      }, onReceiveNotificationAuthorization:
              (Map<String, dynamic> message) async {
        // print("flutter onReceiveNotificationAuthorization: $message");
        setState(() {
          debugLable = "flutter onReceiveNotificationAuthorization: $message";
        });
      });
    } on PlatformException {
      platformVersion = '无法获取消息通知';
    }

    jpush.setup(
      appKey: "7a68ed61810630b52145972e", //你自己应用的 AppKey
      channel: "theChannel",
      production: false,
      debug: true,
    );
    jpush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));

    // 极光平台消息可能会失败，使用try/catch PlatformException.
    jpush.getRegistrationID().then((rid) {
      print("flutter get registration id : $rid");
      setState(() {
        debugLable = "flutter getRegistrationID: $rid";
      });
    });

    if (!mounted) return;

    setState(() {
      debugLable = platformVersion;
    });
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
                Navigator.pushNamed(context, '/deviceMain');
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
