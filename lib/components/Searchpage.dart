import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niceoogling/context/Tastydescendant.dart';
import 'package:niceoogling/resource/math.dart';

class Searchpage extends StatefulWidget {
  Searchpage({Key? key}) : super(key: key);

  @override
  SearchpageState createState() => SearchpageState();
}

class SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: coremeasure_0, right: coremeasure_0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                child: Text("Search for recipes",
                    style: Theme.of(context).textTheme.headline2),
                alignment: Alignment.center,
              ),
            ),
            // Container(
            //   height: coremeasure_17 - coremeasure_11,
            //   width: double.infinity,
            //   child: OverflowBox(
            //     alignment: Alignment.center,
            //     child: Image(
            //       height: coremeasure_18,
            //       fit: BoxFit.cover,
            //       image: NetworkImage(Tastydescendant.imageURL(
            //           from: "http://localhost:3000/pic0.png",
            //           width: coremeasure_18 * 3,
            //           height: coremeasure_18 * 3)),
            //     ),
            //   ),
            // ),
            Container(
              // margin: EdgeInsets.symmetric(
              //     vertical: (coremeasure_10 - coremeasure_5) / 2),
              padding: EdgeInsets.only(left: coremeasure_0),
              // color: Colors.red,
              // height: coremeasure_10,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xFFE4E4E3),
                      width: coremeasure_0 / pow(1.1875, 15)),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              height: coremeasure_5,
              alignment: Alignment.center,
              child: TextFormField(
                minLines: 1,
                maxLines: 1,
                decoration: const InputDecoration.collapsed(
                    hintText: "Search any parameters"),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              // spacing: 8.0, // gap between adjacent chips
              // runSpacing: 4.0, // gap between lines
              children: <Widget>[
                Text("This is a long line"),
                Text("This is a long line"),
                Text("This is a long line"),
                Text("This is a long line"),
             
              ],
            ),
          ],
        ));
  }
}
