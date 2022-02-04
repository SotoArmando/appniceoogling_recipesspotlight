import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:niceoogling/Tastydescendant.dart';
import 'package:niceoogling/descendants/recipe.dart';
import 'package:niceoogling/homepage.dart';
import 'package:niceoogling/libretepage.dart';
import 'package:niceoogling/settingspage.dart';
import 'package:provider/provider.dart';

import './math.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo ',
      theme: ThemeData(
          // Define the default brightness and colors.

          // Define the default font family.
          fontFamily: 'Lator',
          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: GoogleFonts.publicSansTextTheme().copyWith(
            headline1: GoogleFonts.sourceSansPro(
              textStyle: TextStyle(
                  height: 0.01,
                  fontWeight: FontWeight.w300,
                  fontSize: coremeasure_5,
                  color: Colors.black,
                  wordSpacing: coremeasure_0 / (pow(1.1875, 3)),
                  letterSpacing: -.85 + .9225),
            ),
            headline2: GoogleFonts.publicSans(
              textStyle: TextStyle(
                height: 1,
                fontWeight: FontWeight.w500,
                fontSize: coremeasure_0,
                color: Colors.black.withOpacity(0.99705),
                letterSpacing: 1.5750,
              ),
            ),
            bodyText1: GoogleFonts.publicSans(
                height: 1.2,
                color: Colors.black,
                letterSpacing: .12590,
                fontSize: coremeasure_0 / (pow(1.1875, 1.5925))),
            bodyText2: TextStyle(
                height: 1,
                color: Colors.grey[500],
                fontSize: coremeasure_0 / (pow(1.1875, 1.5550))),
          )),
      home: ChangeNotifierProvider(
        create: (context) => Tastydescendant.initialized(),
        child: const MyHomePage(title: ""),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int window = 1;
  final List<StatefulWidget> pages = [
    Libretepage(),
    Homepage(),
    Settingspage()
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final PageController controller =
      PageController(viewportFraction: 1, keepPage: true, initialPage: 1);
  final names = ['Librete', 'Spotlight', 'Search'];
  final icons = [group_20, group_19, group_18];

  void setWindow(int number) {
    controller.jumpToPage(number);
  }

  void updateWindow(int page) {
    setState(() {
      window = page;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(child: Text("Header")),
          ListTile(title: Text("Home"))
        ]),
      ),
      backgroundColor: Color(0xFFf4f4f4),
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(coremeasure_7), // here the desired height
          child: AppBar(
            shape:
                Border(bottom: BorderSide(color: Color(0xFFE4E4E3), width: 1)),
            leading: TextButton(
              child: Icon(group_17,
                  color: Colors.black, size: coremeasure_2 * 1.002575),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            shadowColor: Color(0xFFEEEEFF),
            actions: [
              TextButton(
                child: const Icon(group_1,
                    size: coremeasure_2 * 1.003125, color: Colors.black87),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
            ],
          )),
      body: PageView(
        controller: controller,
        onPageChanged: (page) => updateWindow(page),
        children: pages,
      ),
      bottomNavigationBar: SizedBox(
        height: coremeasure_9,
        child: BottomAppBar(
          color: Color(0xFFf4f4f4),
          elevation: 0,
          child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Color.fromARGB(255, 227, 227, 228),
                          width: 1))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var index in [0, 1, 2])
                    Container(
                      width: coremeasure_10,
                      padding: EdgeInsets.only(
                          bottom: coremeasure_0 / pow(1.1875, 54.700)),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            splashFactory: NoSplash.splashFactory),
                        onPressed: () => setWindow(index),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: coremeasure_0 / pow(1.1875, 6.125)),
                                child: Icon(
                                  icons[index],
                                  size: coremeasure_2 * 1.003125,
                                  color: index != window
                                      ? Colors.grey.shade500
                                      : Colors.black,
                                ),
                              ),
                              Text(index == window ? names[index] : '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing:
                                              1 * pow(1.1875, .125).toDouble(),
                                          color: index != window
                                              ? Colors.grey.shade500
                                              : Colors.black))
                            ]),
                      ),
                    )
                ],
              )),
        ),
      ),
    );
  }
}
