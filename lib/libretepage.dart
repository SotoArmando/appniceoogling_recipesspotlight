import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/Tastydescendant.dart';
import 'package:niceoogling/convenientHorizontalScroller.dart';
import 'package:niceoogling/descendants/recipe.dart';
import 'package:niceoogling/math.dart';
import 'package:provider/provider.dart';

class Libretepage extends StatefulWidget {
  const Libretepage({Key? key}) : super(key: key);

  @override
  _LibretepageState createState() => _LibretepageState();
}

class _LibretepageState extends State<Libretepage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: coremeasure_0 * 0.58,
                        color: Colors.transparent)),
              ),
              child: Column(
                children: [
                  Container(
                    height: coremeasure_2,
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                                colors: [Color(0xFF111100), Colors.black],
                                tileMode: TileMode.mirror,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)
                            .createShader(bounds);
                      },
                      child: Text("Librete",
                          style: Theme.of(context).textTheme.headline2),
                    ),
                    alignment: Alignment.center,
                  ),
                  Consumer<Tastydescendant>(
                    builder: (context, tastydescendant, child) => Stack(
                      children: [
                        if (child != null) child,
                        convenientHorizontalScroller(
                          height: coremeasure_11,
                          width: coremeasure_11,
                          datalist: tastydescendant.homepagefeed0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 1, color: Colors.grey.shade300))),
              alignment: Alignment.center,
              height: coremeasure_2,
              child: Text(
                'Today',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            for (var i in [
              "[Breakfast]: Hot Chocolate Bombs",
              "[Dinner]: New Year's Champagne",
              "[Dinner]: Buffalo Chicken"
            ])
              Container(
                height: coremeasure_2,
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    bottom: coremeasure_0 * 0.54,
                    left: coremeasure_0 * 0.54,
                    right: coremeasure_0 * 0.54),
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.grey.shade400),
                    borderRadius:
                        BorderRadius.all(Radius.circular(coremeasure_2))),
                child: Text(
                  i,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
