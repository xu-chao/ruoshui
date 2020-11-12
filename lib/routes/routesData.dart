import 'package:flutter/material.dart';
import 'package:xuchao/pages/AppHomePage/User/User.dart';
import 'package:xuchao/pages/AppHomePage/User/main/setting_page_view.dart';
import 'package:xuchao/pages/LoginPage/loginPage.dart';
import 'package:xuchao/pages/ProfilePage/user_profile.dart';
import 'package:xuchao/pages/UserPage/register_page.dart';
import 'package:xuchao/pages/UserPage/register_view.dart';
import 'routeName.dart';
import '../pages/ErrorPage/ErrorPage.dart';
import '../pages/AppHomePage/AppHomePage.dart';
import '../pages/SplashPage/SplashPage.dart';
import '../pages/TestDemo/TestDemo.dart';
import '../pages/AppHomePage/Setting/SettingPage.dart';
import '../pages/AppHomePage/Setting/SettingDetailPage.dart';

final String initialRoute = '/'; // 初始默认显示的路由
final Map<String, WidgetBuilder> routesData = {
  // 页面路由定义...
  RouteName.splashPage: (BuildContext context, {params}) => SplashPage(),
  RouteName.appHomePage: (BuildContext context, {params}) =>
      AppHomePage(params: params),
  RouteName.error: (BuildContext context, {params}) =>
      ErrorPage(params: params),
  RouteName.testDemo: (BuildContext context, {params}) =>
      TestDemo(params: params),
  RouteName.settingPage: (BuildContext context, {params}) =>
      SettingPage(params: params),
  RouteName.settingDetailPage: (BuildContext context, {params}) =>
      SettingDetailPage(params: params),
  // RouteName.hotTest: (BuildContext context, {params}) => HotTest(),
  RouteName.loginPage: (BuildContext context, {params}) => LoginPage(),
  RouteName.userProfile: (BuildContext context, {parama}) => UserProfile(),
  RouteName.userPage: (BuildContext context, {parama}) => User(),
  RouteName.settingPageView: (BuildContext context, {params}) =>
      SettingPageView(),
  RouteName.registerPage: (BuildContext context, {params}) => RegisterPage(),
  RouteName.registerView: (BuildContext context, {params}) => RegisterView(),
};
