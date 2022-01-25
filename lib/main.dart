import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:niceoogling/Tastydescendant.dart';
import 'package:niceoogling/descendants/recipe.dart';
import 'package:niceoogling/homepage.dart';
import 'package:niceoogling/libretepage.dart';
import 'package:niceoogling/settingspage.dart';

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
                color: Colors.black.withOpacity(1),
                letterSpacing: .12590,
                fontSize: coremeasure_0 / (pow(1.1875, 1.5925))),
            bodyText2: TextStyle(
                height: 1,
                color: Colors.grey[500],
                fontSize: coremeasure_0 / (pow(1.1875, 1.5550))),
          )),
      home: MyHomePage(title: ""),
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
  List<Recipe> recipelist = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final PageController controller =
      PageController(viewportFraction: 1, keepPage: true, initialPage: 1);
  final names = ['Librete', 'Spotlight', 'Search'];
  final icons = [group_20, group_19, group_18];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void setWindow(int number) {
    controller.jumpToPage(number);
  }

  @override
  void initState() {
    super.initState();
    print('initState listrecipes');
    Tastydescendant.listrecipes(from: 46).then((list) {
      print("length:${list.length}");
      setState(() {
        recipelist = list;
      });
    });
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
            leading: TextButton(
              child: Icon(group_17,
                  color: Colors.black, size: coremeasure_2 * 1.002575),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            backgroundColor: Color(0xFFf4f4f4),
            centerTitle: true,
            elevation: 1 / pow(1.1875, 4.97),
            actions: [
              // TextButton(
              //   child: Icon(Icons.light, color: Colors.black87),
              //   onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              // ),
            ],
          )),
      body: GestureDetector(
        child: PageView(
          scrollBehavior: ScrollBehavior(
              androidOverscrollIndicator: AndroidOverscrollIndicator.glow),
          controller: controller,
          onPageChanged: (int page) {
            setState(() {
              window = page;
            });
          },
          children: [
            Libretepage(),
            Homepage(datalist: recipelist),
            Settingspage()
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: coremeasure_9,
        child: BottomAppBar(
          color: Color(0xFFf4f4f4),
          elevation: 0,
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
                                      letterSpacing:
                                          1 * pow(1.1875, .125).toDouble(),
                                      color: index != window
                                          ? Colors.grey.shade500
                                          : Colors.black))
                        ]),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
