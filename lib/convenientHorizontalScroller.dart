import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/descendants/recipe.dart';
import 'package:niceoogling/gradienttext.dart';
import 'package:niceoogling/math.dart';

class convenientHorizontalScroller extends StatefulWidget {
  double height;
  double width;
  List<Recipe>? datalist;
  convenientHorizontalScroller({
    Key? key,
    double this.height = coremeasure_1,
    double this.width = coremeasure_1,
    this.datalist,
  }) : super(key: key);

  @override
  _convenientHorizontalScrollerState createState() =>
      _convenientHorizontalScrollerState();
}

class _convenientHorizontalScrollerState
    extends State<convenientHorizontalScroller> {
  @override
  Widget build(BuildContext context) {
    double labelsize = coremeasure_6;
    double containerheight = widget.height + labelsize;
    double elementswidth = widget.width;
    return Container(
      margin: EdgeInsets.only(bottom: coremeasure_0),
      height: containerheight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          // This next line does the trick.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            for (Recipe item in widget.datalist as List<Recipe>)
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
                                alignment: Alignment.center,
                                image: NetworkImage(item.thumbnail_url))),
                        width: elementswidth,
                      ),
                    ),
                    Container(
                      height: labelsize,
                      width: elementswidth,
                      alignment: Alignment.topLeft,
                      color: Color(0xFFf4f4f4),
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
                        child: Text("${item.name}",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyText1),
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
