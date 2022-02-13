import 'dart:html';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:niceoogling/Tastydescendant.dart';
import 'package:niceoogling/convenientNestedNavigator.dart';
import 'package:niceoogling/descendants/recipe.dart';
import 'package:niceoogling/homepage.dart';
import 'package:niceoogling/libretepage.dart';
import 'package:niceoogling/recipeportascendant.dart';
import 'package:niceoogling/search.dart';
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
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.deepPurple, //  <-- dark color
            textTheme: ButtonTextTheme
                .primary, //  <-- this auto selects the right color
          ),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          }),
          // Define the default brightness and colors.
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.black,
                  ),
                  overlayColor: MaterialStateProperty.all<Color>(
                    Colors.orange,
                  ))),
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
                  letterSpacing: coremeasure_0 / (pow(1.1875, 18.9))),
            ),
            headline2: GoogleFonts.publicSans(
              textStyle: TextStyle(
                height: 1,
                fontWeight: FontWeight.w500,
                fontSize: coremeasure_0,
                color: Colors.black.withOpacity(0.99705),
                letterSpacing: coremeasure_0 / (pow(1.1875, 13.7791)),
              ),
            ),
            bodyText1: GoogleFonts.publicSans(
                height: 1.2,
                color: Colors.black,
                letterSpacing: coremeasure_0 / (pow(1.1875, 28.541)),
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
  final List<Widget> pages = [
    Libretepage(),
    Homepage(),
    Searchscreen(),
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
            shape: Border(
                bottom: BorderSide(
                    color: Color(0xFFE4E4E3),
                    width: coremeasure_0 / pow(1.1875, 15))),
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              height: coremeasure_7,
              padding: EdgeInsets.only(left: coremeasure_0 / pow(1.1875, 5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: coremeasure_7,
                    width: coremeasure_5,
                    margin: EdgeInsets.only(
                        right: coremeasure_0 / pow(1.1875, 10.75)),
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(Tastydescendant.imageURL(
                                  from:
                                      "https://lh3.googleusercontent.com/cqhclZ29NEXuFjCpwH-qkcATVUVqv6KBZ9cGEZSECJO7js8g884OxhTz3HhUgy9Nm0fk=s85"))),
                          shape: BoxShape.circle),
                      width: coremeasure_4,
                      height: coremeasure_4,
                    ),
                  ),
                  ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                                colors: [
                              Color.fromARGB(255, 17, 17, 0),
                              Color.fromARGB(255, 1, 0, 19)
                            ],
                                tileMode: TileMode.mirror,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                            .createShader(bounds);
                      },
                      child: Text(
                        "",
                        style: Theme.of(context).textTheme.headline2,
                      )),
                ],
              ),
            ),
            leadingWidth: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            toolbarHeight: coremeasure_7,
            elevation: 0,
            shadowColor: Color(0xFFEEEEFF),
            actions: [
              TextButton(
                child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                              colors: [
                            Color.fromARGB(255, 17, 17, 0),
                            Color.fromARGB(255, 1, 0, 19)
                          ],
                              tileMode: TileMode.mirror,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          .createShader(bounds);
                    },
                    child: const Icon(group_25,
                        size: coremeasure_2 * 1.003125, color: Colors.black87)),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
            ],
          )),
      body: Navigator(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => Container(
                    padding: EdgeInsets.only(top: coremeasure_0),
                    color: Color(0xFFf4f4f4),
                    child: PageView(
                      controller: controller,
                      onPageChanged: (page) => updateWindow(page),
                      children: pages,
                    ),
                  );
              break;
            case 'activities/readrecipe':
              builder = (BuildContext context) => RecipeportAscendant();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }

          // var a = PageRouteBuilder(pageBuilder: builder, settings: settings);
          return MaterialPageRoute<void>(builder: builder, settings: settings);
        },
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
                          width: coremeasure_0 / pow(1.1875, 15)))),
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
                          child: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                      colors: index != window
                                          ? [
                                              Color.fromARGB(
                                                  255, 217, 217, 200),
                                              Color.fromARGB(255, 201, 200, 219)
                                            ]
                                          : [
                                              Color.fromARGB(255, 17, 17, 0),
                                              Color.fromARGB(255, 1, 0, 19)
                                            ],
                                      tileMode: TileMode.mirror,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)
                                  .createShader(bounds);
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        bottom:
                                            coremeasure_0 / pow(1.1875, 6.125)),
                                    child: Icon(icons[index],
                                        size: coremeasure_2 * 1.003125,
                                        color: Colors.grey.shade500),
                                  ),
                                  Text(index == window ? names[index] : '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1 *
                                                  pow(1.1875, .125).toDouble(),
                                              color: index != window
                                                  ? Colors.grey.shade500
                                                  : Colors.black))
                                ]),
                          ),
                        ))
                ],
              )),
        ),
      ),
    );
  }
}
