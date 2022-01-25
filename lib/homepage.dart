import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/Tastydescendant.dart';
import 'package:niceoogling/convenientHorizontalScroller.dart';
import 'package:niceoogling/descendants/recipe.dart';
import 'package:niceoogling/math.dart';

class Homepage extends StatefulWidget {
  final List<Recipe>? datalist;

  const Homepage({Key? key, this.datalist}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Recipe> recipelist1 = [];
  List<Recipe> recipelist2 = [];
  List<Recipe> recipelist3 = [];
  @override
  void initState() {
    super.initState();
    print('initState listrecipes');
    Tastydescendant.listrecipes(from: 31).then((list) {
      setState(() {
        recipelist1 = list;
      });
    });
    Tastydescendant.listrecipes(from: 36).then((list) {
      setState(() {
        recipelist2 = list;
      });
    });
    Tastydescendant.listrecipes(from: 19).then((list) {
      setState(() {
        recipelist3 = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var names = ["Chinese home food", "Greated Smoothie", "Greated Smile"];
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topLeft,
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/a.png'))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: coremeasure_0 * 0.24),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0, color: Colors.transparent)),
              ),
              child: Column(
                children: [
                  Container(
                    height: coremeasure_4,
                    child: Text("Spotlight",
                        style: Theme.of(context).textTheme.headline2),
                    alignment: Alignment.center,
                  ),
                  convenientHorizontalScroller(
                      height: coremeasure_12,
                      width: coremeasure_12,
                      datalist: widget.datalist),
                ],
              ),
            ),
            for (var index in [0, 1, 2])
              Container(
                margin: EdgeInsets.only(top: coremeasure_0),
                foregroundDecoration: BoxDecoration(
                    color: index % 2 != 0
                        ? Colors.blue.shade300.withOpacity(.00075)
                        : Colors.red.shade400.withOpacity(.00075)),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: coremeasure_0 * 0.54,
                          bottom: coremeasure_0 * 0.54),
                      child: Text(
                        names[index],
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    convenientHorizontalScroller(
                        height: coremeasure_13,
                        width: coremeasure_13,
                        datalist: [
                          recipelist1,
                          recipelist2,
                          recipelist3
                        ][index]),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
