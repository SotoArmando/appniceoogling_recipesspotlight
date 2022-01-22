import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/convenientHorizontalScroller.dart';
import 'package:niceoogling/math.dart';

class Libretepage extends StatefulWidget {
  Libretepage({Key? key}) : super(key: key);

  @override
  _LibretepageState createState() => _LibretepageState();
}

class _LibretepageState extends State<Libretepage> {
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
                    height: coremeasure_4,
                    child: Text("Librete",
                        style: Theme.of(context).textTheme.headline2),
                    alignment: Alignment.center,
                  ),
                  convenientHorizontalScroller(
                    height: coremeasure_13,
                    width: coremeasure_12,
                  ),
                ],
              ),
            ),
            Container(
              height: coremeasure_6,
              child: Text(
                '16 Jan - 23 Jan',
                style: Theme.of(context).textTheme.headline2,
              ),
              alignment: Alignment.center,
            ),
            for (var i in [
              "Monday",
            ])
              Container(
                height: coremeasure_4,
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
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
