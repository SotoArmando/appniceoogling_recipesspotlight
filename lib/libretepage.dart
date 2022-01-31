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
                      bottom: BorderSide(width: 1, color: Color(0xFFEEEEF5)))),
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
                          bottomspace: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                        colors: [Color(0xFF111100), Colors.black],
                        tileMode: TileMode.mirror,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    .createShader(bounds);
              },
              child: Container(
                alignment: Alignment.center,
                height: coremeasure_2,
                child: Text(
                  'Today',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            for (var i in [0])
              Container(
                  padding: EdgeInsets.only(
                      left: coremeasure_1, right: coremeasure_1),
                  height: coremeasure_7,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      bottom: coremeasure_0 * 0.54,
                      left: coremeasure_0 * 0.54,
                      right: coremeasure_0 * 0.54),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Color(0xFFEEEEF5)),
                      borderRadius:
                          BorderRadius.all(Radius.circular(coremeasure_2))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        [
                          "Breakfast 7 AM\nLunch Mid-day\nDinner 6 PM",
                        ][i],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        [
                          "Hot Chocolate Bombs\nNew Year's Champagne\nBuffalo Chicken",
                        ][i],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
