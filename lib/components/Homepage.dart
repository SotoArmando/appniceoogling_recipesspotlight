import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niceoogling/components/convenientHorizontalScroller.dart';
import 'package:niceoogling/context/Tastydescendant.dart';
import 'package:niceoogling/resource/math.dart';
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

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              alignment: Alignment.topLeft,
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/a.png'))),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                      colors: [Colors.black, Color(0xFF000511)],
                      tileMode: TileMode.mirror,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)
                  .createShader(bounds);
            },
            child: Container(
              height: coremeasure_3,
              child: Text("Spotlight",
                  style: Theme.of(context).textTheme.headline2),
              alignment: Alignment.center,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: coremeasure_0 / pow(1.1875, 12.5)),
            margin: EdgeInsets.only(
                bottom: (coremeasure_0 / pow(1.1875, 10)) + coremeasure_3),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: coremeasure_0 / pow(1.1875, 15),
                      color: Color(0xFFE4E4E3))),
            ),
            child: Column(
              children: [
                Consumer<Tastydescendant>(
                  builder: (context, tastydescendant, child) => Stack(
                    children: [
                      if (child != null) child,
                      convenientHorizontalScroller(
                          bottomspace: false,
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
                        left: coremeasure_0 / pow(1.1875, 0.25),
                        bottom: coremeasure_0 +
                            (coremeasure_0 / pow(1.1875, 0.175)),
                        top: coremeasure_0),
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                                colors: [
                              Color.fromARGB(255, 038, 038, 017),
                              Color.fromARGB(255, 026, 022, 077)
                            ],
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
                    builder: (context, tastydescendant, child) =>
                        (child != null)
                            ? child
                            : convenientHorizontalScroller(
                                height: coremeasure_12,
                                width: coremeasure_12,
                                datalist: [
                                  tastydescendant.homepagefeed0,
                                  tastydescendant.homepagefeed1,
                                  tastydescendant.homepagefeed2
                                ][index]),
                  ),
                ],
              ),
            ),
        ][index],
      ),
    );
  }
}
