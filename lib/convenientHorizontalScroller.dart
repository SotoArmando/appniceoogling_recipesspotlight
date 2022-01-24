import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/gradienttext.dart';
import 'package:niceoogling/math.dart';

class convenientHorizontalScroller extends StatefulWidget {
  final double
      height; // <--- generates the error, "Field doesn't override an inherited getter or setter"
  final double
      width; // <--- generates the error, "Field doesn't override an inherited getter or setter"

  convenientHorizontalScroller(
      {Key? key,
      double this.height = coremeasure_1,
      double this.width = coremeasure_1})
      : super(key: key);

  @override
  _convenientHorizontalScrollerState createState() =>
      _convenientHorizontalScrollerState();
}

class _convenientHorizontalScrollerState
    extends State<convenientHorizontalScroller> {
  @override
  Widget build(BuildContext context) {
    double containerheight = widget.height;
    double elementswidth = widget.width;
    return Container(
      height: containerheight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          // This next line does the trick.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            for (var item in [0, 1, 2, 3, 4, 5])
              Container(
                margin: EdgeInsets.only(
                    left: item == 0
                        ? coremeasure_0 * 0.54
                        : coremeasure_0 * 0.945),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://img.buzzfeed.com/tasty-app-user-assets-prod-us-east-1/recipes/6cf5d3c1fc204d129bcc8908b7dc7a1d.jpeg?resize=1000:*&output-format=auto&output-quality=auto'))),
                        width: elementswidth,
                      ),
                    ),
                    Container(
                      width: elementswidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            color: Color(0xFFf4f4f4),
                            child: ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                        colors: [
                                      Color(0xFF131F25),
                                      Colors.grey.shade900
                                    ],
                                        tileMode: TileMode.mirror,
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter)
                                    .createShader(bounds);
                              },
                              child: Text(
                                  "It takes all of five minutes to fry some bacon + an egg.",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ),
                          )
                        ],
                      ),
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
