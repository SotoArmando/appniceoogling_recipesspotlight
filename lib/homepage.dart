import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/convenientHorizontalScroller.dart';
import 'package:niceoogling/math.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

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
              padding: EdgeInsets.only(bottom: coremeasure_0 * 0.58),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey.shade300)),
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
                    height: coremeasure_13,
                    width: coremeasure_12,
                  ),
                ],
              ),
            ),
            for (var index in [0, 1, 2])
              Container(
                margin: EdgeInsets.only(
                    bottom: coremeasure_0, top: coremeasure_0 * 0.18),
                foregroundDecoration: BoxDecoration(
                    color: index % 2 != 0
                        ? Colors.blue.shade300.withOpacity(.00075)
                        : Colors.red.shade400.withOpacity(.00075)),
                child: Column(
                  children: [
                    Container(
                      height: coremeasure_8,
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
                      height: coremeasure_14,
                      width: coremeasure_13,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
