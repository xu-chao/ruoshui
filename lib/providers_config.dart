import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'pages/AppHomePage/Home/provider/counterStore.p.dart';
import 'pages/AppHomePage/provider/appHomePageStore.p.dart';

List<SingleChildWidget> providersConfig = [
  ChangeNotifierProvider<AppHomePageStore>.value(value: AppHomePageStore()),

  /// provider 练习测试用
  ChangeNotifierProvider<CounterStore>.value(value: CounterStore()),
];
