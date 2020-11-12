import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xuchao/components/Background/ThreeLayerBackground.dart';
import 'package:xuchao/pages/AppHomePage/Shop/theme/extention.dart';

class ShopTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _appBar() {
      return AppBar(
        elevation: 0,
        // backgroundColor: Theme.of(context).backgroundColor,
        title: new Text('设备'),
        centerTitle: true,
        leading: Icon(
          Icons.short_text,
          size: 30,
          color: Colors.black,
        ),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.android),
              tooltip: '设备',
              onPressed: () {
                Navigator.pushNamed(context, '/testDemo');
              }),
          // Icon(
          //   Icons.android,
          //   size: 30,
          //   color: LightColor.black,
          // ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
              child: Image.asset("asset/device/avatar.png", fit: BoxFit.fill),
            ),
          ).p(8),
        ],
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('设备'),
      //   centerTitle: true,
      //   leading: new Icon(Icons.android),
      //   automaticallyImplyLeading: false,
      // ),
      appBar: _appBar(),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 25, 30, 15),
              alignment: Alignment.centerLeft,
              child: Text(
                '统计',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    color: Color.fromARGB(255, 0, 199, 140),
                    fontSize: 22,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ThreeLayerBackground(),
                  Card(
                    // color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.android),
                          title: Text('今日喝水'),
                          subtitle: Text('1560ml'),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('详细'),
                              onPressed: () {},
                            ),
                            FlatButton(
                              child: const Text('设备同步'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.fromLTRB(30, 200, 30, 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          leading: Icon(Icons.android),
                          title: Text('本月喝水'),
                          subtitle: Text('7256ml'),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('详细'),
                              onPressed: () {},
                            ),
                            FlatButton(
                              child: const Text('设备同步'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(15)),
                  //   margin: EdgeInsets.fromLTRB(30, 370, 30, 30),
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: <Widget>[
                  //       const ListTile(
                  //         leading: Icon(Icons.android),
                  //         title: Text('历史喝水'),
                  //         subtitle: Text('54388ml'),
                  //       ),
                  //       ButtonBar(
                  //         children: <Widget>[
                  //           FlatButton(
                  //             child: const Text('详细'),
                  //             onPressed: () {},
                  //           ),
                  //           FlatButton(
                  //             child: const Text('设备同步'),
                  //             onPressed: () {},
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
      // Container(
      //   // color: Colors.green,
      //   width: double.infinity,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text('设备'),
      //     ],
      //   ),
      // ),
    );
  }
}
