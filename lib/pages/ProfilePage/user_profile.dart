import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<StatefulWidget> {
  Widget _placeContainer(String title, Color color, bool leftIcon) {
    return Column(
      children: <Widget>[
        Container(
            height: 70,
            width: MediaQuery.of(context).size.width - 40,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: color),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      color: leftIcon ? Color(0xffa3a3a3) : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                leftIcon
                    ? Icon(
                        Icons.arrow_right,
                        color: Color(0xffa3a3a3),
                      )
                    : Container()
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('个人设置'),
        ),
        body: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            // color: Color(0xffe7eaf2),
            // color: Theme.of(context).backgroundColor,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(40.0, 40, 40, 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // SizedBox(
                //   height: 20,
                // ),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   child: Text(
                //     '个人设置',
                //     style: TextStyle(fontSize: 43, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // SizedBox(
                //   height: 50,
                // ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(10, 15),
                            color: Color(0x22000000),
                            blurRadius: 20.0)
                      ],
                      image: DecorationImage(
                        // image: NetworkImage('网络请求地址')
                        image: new ExactAssetImage('asset/device/avatar.png'),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '叁仟',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 70,
                ),
                _placeContainer('我的饮水健况', Color(0xff526fff), false),
                _placeContainer('我拥有的智能水杯', Color(0xff8f48ff), false),
                _placeContainer('关于我', Color(0xffffffff), true),
                // SizedBox(
                //   height: MediaQuery.of(context).padding.bottom,
                // )
              ],
            ),
          ),
        ));
  }
}
