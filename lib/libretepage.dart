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
      color: Color(0xFFf4f4f4),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: coremeasure_0 / pow(1.1875, 15),
                          color: Color(0xFFEBEBE4)))),
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
                      child: Text("Sweet Breakfast Librete",
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
                          datalist: tastydescendant.homepagelibrete0,
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
                margin: EdgeInsets.only(top: coremeasure_0 / pow(1.1875, 40)),
                alignment: Alignment.center,
                height: coremeasure_2,
                child: Text(
                  'Feb 4',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            for (var i in [0, 1, 2])
              Container(
                padding: EdgeInsets.only(
                    left: coremeasure_1,
                    right: coremeasure_1,
                    bottom: coremeasure_0 / pow(1.1875, 10)),
                height: coremeasure_6,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    bottom: coremeasure_0 / pow(1.1875, 8),
                    right: coremeasure_0 / pow(1.1875, 12),
                    left: coremeasure_0 / pow(1.1875, 12)),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: coremeasure_0 / pow(1.1875, 15),
                        color: Color(0xFFE4E4E3)),
                    borderRadius:
                        BorderRadius.all(Radius.circular(coremeasure_2))),
                child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                              colors: [
                            Color.fromARGB(255, 17, 14, 0),
                            Color.fromARGB(255, 1, 0, 17)
                          ],
                              tileMode: TileMode.mirror,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)
                          .createShader(bounds);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: coremeasure_0,
                          alignment: Alignment.centerLeft,
                          child: Row(children: [
                            Container(
                              width: coremeasure_7,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "10 min",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1),
                              ),
                            ),
                            Text(
                              [
                                "Breakfast 7 AM",
                                "Lunch Mid-day",
                                "Dinner 6 PM"
                              ][i],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1),
                            )
                          ]),
                        ),
                        Text(
                          [
                            "Cheesecakes Espresso Martini Cheesecake For 2",
                            "New Year's Champagne",
                            "Buffalo Chicken"
                          ][i],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
