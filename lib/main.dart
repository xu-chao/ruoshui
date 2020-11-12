import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jh_debug/jh_debug.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:xuchao/config/provider_manager.dart';
import 'package:xuchao/config/storage_manager.dart';
import 'package:xuchao/generated/l10n.dart';
import 'package:xuchao/provider/locale_model.dart';
import 'package:xuchao/provider/theme_model.dart';
import 'routes/onGenerateRoute.dart';
import 'routes/routesData.dart'; // 路由配置
import 'providers_config.dart'; // providers配置文件
import 'ioc/locator.dart' show setupLocator, locator, CommonService;
import 'package:ana_page_loop/ana_page_loop.dart' show anaAllObs;
import 'utils/myAppSetup/index.dart' show myAppSetup;

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();

  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));

  setupLocator();

  jhDebugMain(
    appChild: MultiProvider(
      providers: providersConfig,
      child: MyApp(),
    ),
    debugMode: DebugMode.inConsole,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    jhDebug.setGlobalKey = locator.get<CommonService>().getGlobalKey;
    myAppSetup();
    return OKToast(
      child: MultiProvider(
        providers: providers,
        // providers: <SingleChildWidget>[
        //   ChangeNotifierProvider.value(value: ThemeModel()), //主题 provider
        //   ChangeNotifierProvider.value(value: LocaleModel()), //本地语种 provider
        // ],
        child: Consumer2<ThemeModel, LocaleModel>(
          builder:
              (BuildContext context, themeModel, localeModel, Widget child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeModel.themeData(),
              darkTheme: themeModel.themeData(platformDarkMode: true),
              locale: localeModel.locale,
              localizationsDelegates: [
                S.delegate, //支持语种对应的字段
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              supportedLocales: S.delegate.supportedLocales, //支持的语种
              //路由自行配置 flutter自带 或者 fluro
              initialRoute: initialRoute,
              onGenerateRoute: onGenerateRoute,
              // debugShowCheckedModeBanner: false,
              navigatorObservers: [...anaAllObs()],
            );
          },
        ),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
