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

          children: <Widget>[
            for (var item in [0, 1, 2, 3, 4, 5])
              Container(
                margin: EdgeInsets.only(
                    left: item == 0
                        ? coremeasure_0 * 0.54
                        : coremeasure_0 * 0.945),
                width: elementswidth,
                color: item % 2 == 0 ? Colors.grey[300] : Colors.grey[200],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      foregroundDecoration: BoxDecoration(),
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                                  colors: [
                                Colors.grey.shade600.withOpacity(.907775),
                                Colors.grey.shade600
                              ],
                                  tileMode: TileMode.mirror,
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)
                              .createShader(bounds);
                        },
                        child: Text('nice description to this recipe',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
