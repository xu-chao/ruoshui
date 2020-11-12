class DrinksListData {
  DrinksListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.drinks,
    this.volume = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String> drinks;
  int volume;

  static List<DrinksListData> tabIconsList = <DrinksListData>[
    DrinksListData(
      imagePath: 'asset/rs/drink1.png',
      titleTxt: '板蓝根泡黄枸杞',
      volume: 550,
      drinks: <String>['保健', '祛寒', '养生'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    DrinksListData(
      imagePath: 'asset/rs/drink2.png',
      titleTxt: '香蕉汁配大冬枣',
      volume: 550,
      drinks: <String>['味道秒', '维C丰富', '欲罢不能'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    DrinksListData(
      imagePath: 'asset/rs/drink3.png',
      titleTxt: '热水冲方便面调料',
      volume: 550,
      drinks: <String>['小时候的味道', '喝了都说好'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    DrinksListData(
      imagePath: 'asset/rs/drink4.png',
      titleTxt: '珍珠奶茶兑橙汁',
      volume: 550,
      drinks: <String>['意想不到的组合', '呦，还不错'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
