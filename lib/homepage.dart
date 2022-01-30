import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/Tastydescendant.dart';
import 'package:niceoogling/convenientHorizontalScroller.dart';
import 'package:niceoogling/descendants/recipe.dart';
import 'package:niceoogling/math.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with AutomaticKeepAliveClientMixin<Homepage> {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var names = ["Chinese home food", "Greated Smoothie", "Greated Smile"];
    Provider.of<Tastydescendant>(context, listen: false).loadhomepagefeatures();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topLeft,
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/a.png'))),
      child: ListView(
        children: <Widget>[
          Container(
            height: coremeasure_2,
            child:
                Text("Spotlight", style: Theme.of(context).textTheme.headline2),
            alignment: Alignment.center,
          ),
          Container(
            padding: EdgeInsets.only(bottom: coremeasure_0 * 0.24),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 0, color: Colors.transparent)),
            ),
            child: Column(
              children: [
                Consumer<Tastydescendant>(
                  builder: (context, tastydescendant, child) => Stack(
                    children: [
                      if (child != null) child,
                      convenientHorizontalScroller(
                          height: coremeasure_11,
                          width: coremeasure_11,
                          datalist: tastydescendant.homepagefeature0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          for (var index in [0, 1, 2])
            Container(
              foregroundDecoration: BoxDecoration(
                  color: index % 2 != 0
                      ? Colors.blue.shade300.withOpacity(.00075)
                      : Colors.red.shade400.withOpacity(.00075)),
              child: Column(
                children: [
                  Container(
                    height: coremeasure_6,
                    padding: EdgeInsets.only(
                        left: coremeasure_0 * 0.54,
                        bottom: coremeasure_0,
                        top: coremeasure_0),
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
                      child: Text(
                        names[index],
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                  ),
                  Consumer<Tastydescendant>(
                    builder: (context, tastydescendant, child) => Stack(
                      children: [
                        if (child != null) child,
                        convenientHorizontalScroller(
                            height: coremeasure_12,
                            width: coremeasure_12,
                            datalist: [
                              tastydescendant.homepagefeed0,
                              tastydescendant.homepagefeed1,
                              tastydescendant.homepagefeed2
                            ][index]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
