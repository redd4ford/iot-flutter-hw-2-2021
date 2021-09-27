import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дія',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class CardContent {
  String title;
  String fullName;
  String text;

  CardContent(
      {this.title = 'Document',
      this.fullName = 'Lorem Ipsum',
      this.text =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'});
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    var toolbarRowHeight =
        orientation == Orientation.portrait ? size.height / 8 : size.width / 10;
    var centerColumnWidth = size.width / 10;
    var iconsSize = orientation == Orientation.portrait
        ? toolbarRowHeight / 4
        : toolbarRowHeight / 2;
    var carouselIndicatorWidth =
        size.height / (size.height / size.width * 2.25);
    var appLogoSize = orientation == Orientation.portrait
        ? size.width / 10
        : size.height / 10;

    const cardTitleFontSize = 28.0;
    const cardFullNameFontSize = 24.0;
    const standardTextFontSize = 14.0;

    final bgColors = [
      const Color.fromRGBO(53, 74, 101, 1.0),
      const Color.fromRGBO(60, 50, 40, 1.0),
      const Color.fromRGBO(77, 59, 73, 1.0),
      const Color.fromRGBO(27, 102, 134, 1.0),
      const Color.fromRGBO(42, 60, 74, 1.0),
    ];

    final cardColors = [
      const Color.fromRGBO(39, 51, 63, 1.0),
      const Color.fromRGBO(44, 39, 35, 1.0),
      const Color.fromRGBO(52, 42, 50, 1.0),
      const Color.fromRGBO(27, 64, 80, 1.0),
      const Color.fromRGBO(35, 44, 51, 1.0),
    ];

    final cards = [
      CardContent(title: 'Паспорт громадянина України 🇺🇦'),
      CardContent(title: 'Студентський квиток'),
      CardContent(title: 'Картка платника податків'),
      CardContent(title: 'Закордонний паспорт'),
      CardContent(title: 'Свідоцтво про народження дитини'),
    ];

    return Scaffold(
      backgroundColor: bgColors[_index],
      appBar: AppBar(
          toolbarHeight: toolbarRowHeight,
          titleSpacing: centerColumnWidth,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: SvgPicture.network(
                  'https://upload.wikimedia.org/wikipedia/commons/8/89/DiiaLogo.svg',
                  height: appLogoSize,
                  width: appLogoSize,
                ),
              ),
              Icon(
                Icons.qr_code_scanner_rounded,
                size: iconsSize,
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: SizedBox(
              child: PageView.builder(
                itemCount: cards.length,
                controller: PageController(viewportFraction: 0.85),
                onPageChanged: (int index) => setState(() => _index = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: Card(
                      color: cardColors[_index],
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: centerColumnWidth / 2),
                            child: Text(
                              cards[i].title,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: cardTitleFontSize,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            cards[i].fullName,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: cardFullNameFontSize,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: centerColumnWidth / 2),
                            child: Text(
                              cards[i].text,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontSize: standardTextFontSize,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: centerColumnWidth / 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.more_horiz_rounded,
                                  size: iconsSize,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        'Дані оновлено ${DateFormat('dd.MM.yyyy о HH:mm').format(DateTime.now())}',
                        style: const TextStyle(
                          fontSize: standardTextFontSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: orientation == Orientation.portrait
                            ? centerColumnWidth * 4
                            : carouselIndicatorWidth),
                    child: GridView.builder(
                      itemCount: cards.length,
                      itemBuilder: (_, i) => Container(
                        decoration: BoxDecoration(
                            color:
                                i == _index ? Colors.black : cardColors[_index],
                            shape: BoxShape.circle),
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cards.length,
                        crossAxisSpacing: cards.length.toDouble(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file_rounded),
            label: 'Документи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on_rounded),
            label: 'Послуги',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Повідомлення',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_rounded),
            label: 'Меню',
          ),
        ],
        selectedLabelStyle: const TextStyle(fontSize: standardTextFontSize),
        unselectedLabelStyle: const TextStyle(fontSize: standardTextFontSize),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
