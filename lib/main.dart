import 'dart:math';

import 'package:flutter/material.dart';
import 'package:niceoogling/convenientHorizontalScroller.dart';
import 'package:google_fonts/google_fonts.dart';
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
      title: 'Flutter Demo ',
      theme: ThemeData(
        // Define the default brightness and colors.

        // Define the default font family.
        fontFamily: 'Lator',
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: GoogleFonts.beVietnamProTextTheme(textTheme).copyWith(
            headline1: GoogleFonts.sourceSansPro(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: coremeasure_5,
                  color: Colors.black,
                  letterSpacing: -.85 + .9225),
            ),
            headline2: GoogleFonts.sourceSansPro(
              textStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: coremeasure_0,
                color: Colors.black.withOpacity(0.99705),
                letterSpacing: 1.5750,
              ),
            ),
            bodyText1: TextStyle(
                color: Colors.grey[600],
                fontSize: coremeasure_0 / (pow(1.1875, 1.5925)))),
      ),
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _incrementCounter() {
    setState(() {
      _counter++;
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
      bottomNavigationBar: SizedBox(
        height: coremeasure_8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ),
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(coremeasure_7), // here the desired height
          child: AppBar(
            leading: TextButton(
              child: Icon(Icons.menu, color: Colors.black87),
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            backgroundColor: Color(0xFFf4f4f4),
            centerTitle: true,
            elevation: 0,
            actions: [
              TextButton(
                child: Icon(Icons.light, color: Colors.black87),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
            ],
          )),
      body: PageView(
        controller: PageController(
          initialPage: 1,
          viewportFraction: 1,
        ),
        children: [Libretepage(), Homepage(), Settingspage()],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
