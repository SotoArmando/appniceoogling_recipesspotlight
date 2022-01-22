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
              image: NetworkImage(
                  'https://lh3.googleusercontent.com/5wq01ZdDZrIvWjT_2zYUkvdgTwyECSZOztKItENWHCTMq2tuCh2ubpa0YbNXv3iRcvdPoviXuCR03ttnd4_D=w1920-h945'))),
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
                        ? Colors.blue.shade300.withOpacity(.0225)
                        : Colors.red.shade400.withOpacity(.0225)),
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
